import math
import os

from collections import OrderedDict

import utils
from extruder import Extruder
from gcode import GCode
from layer import Layer, FirstLayer, ACT_PASS, ACT_INFILL, ACT_SWITCH
from switch_tower import SwitchTower
from preprime import PrePrime
from settings import Settings


gcode = GCode()

SLICER_CURA = "Cura"
SLICER_KISSLICER = "KISSlicer"
SLICER_SIMPLIFY3D = "Simplify3d"
SLICER_SLIC3R = "Slic3r"
SLICER_PRUSA_SLIC3R = "PrusaSlic3r"


class Tower:
    def __init__(self):
        self.z = {}
        self.min_z = None

    def add(self, z, _type):
        if z not in self.z:
            self.z[z] = _type

    def calculate_min_z(self):
        prev_z = 0
        for z in self.z:
            if self.z[z] >= 0:
                z_h = round(z - prev_z, 5)
                if self.min_z is None or z_h < self.min_z:
                    self.min_z = z_h
            prev_z = z


class GCodeFile:
    slicer_type = None

    def __init__(self, logger, settings: Settings):
        """
        G-code file base class. Not to be used directly
        :param logger: Logger object
        :param hw_config: system configuration (PEEK, PTFE, E3Dv6)
        :param tower_position: purge tower postion setting
        :param purge_lines: amount of post purge lines
        """
        self.log = logger
        self.settings = {}
        self.gcode_file = None
        self.material = None
        self.extruders = {}
        self.switch_tower = None
        self.layers = []
        self.filtered_layers = []
        self.pr_index = None
        # material switch z heights
        self.layer_height = None

        self.tool_switch_heights = {}
        self.last_switch_height = 0

        self.settings = settings
        self.log.info("HW config: %s" % self.settings.hw_config)

        #List of tools numbers in the order they are used
        self.tools = []

        # max slots needed
        self.max_slots = None

        # preprime handler
        self.preprime = None

        # currently active e
        self.active_e = 0

        # min z height
        self.min_layer_h = None

        # Slicer version
        self.version = None

        self.towers = {}

    def parse_header(self):
        """
        Parse header of gcode file, if any.
        Implement in slicer specific code

        """
        raise NotImplementedError()

    def parse_print_settings(self):
        """ Parse print settings """

        # find start script end
        is_tool_change = False
        for cmd, comment, index in self.layers[0].read_lines():
            if comment and comment.strip() == b"START SCRIPT END":
                self.layers[0].start_gcode_end = index
                self.pr_index = index
                break

        for layer in self.layers:
            for cmd, comment, index in layer.read_lines():
                if cmd:
                    # find linear advance commands
                    if gcode.is_lin_advance(cmd) and gcode.last_match != 0:
                        self.settings.linear_advance = gcode.last_match
                    elif gcode.is_pressure_advance(cmd) and gcode.last_match != 0:
                        self.settings.pressure_advance = gcode.last_match

        if not self.layers[0].start_gcode_end:
            raise ValueError("Cannot find 'START SCRIPT END'-comment. Please add it to your Slicer's config")

        if self.tool_switch_heights:
            self.last_switch_height = max(self.tool_switch_heights.values())

        # prerun prime handling
        if self.settings.get_hw_config_value("prerun.prime") == "True":
            self.log.debug("Preprime enabled")
            self.preprime = PrePrime(self.log, self.settings, self.max_slots, self.extruders, self.tools)
            for line in self.preprime.get_prime_lines():
                if line:
                    self.pr_index += self.layers[0].insert_line(self.pr_index, line[0], line[1])
            self.active_e = self.preprime.last_extruder
            self.layers[0].start_gcode_end = self.pr_index
        else:
            self.log.warning("No pre-prime run")
            self.active_e = self.extruders[0]

        # find first tool change and remove it if it's before any print moves. No need to
        # do tool change here
        for cmd, comment, index in self.layers[0].read_lines():
            if not cmd or index <= self.layers[0].start_gcode_end:
                continue
            if gcode.is_tool_change(cmd) is not None:
                if self.settings.get_hw_config_value("prerun.prime") == "True" or gcode.last_match == 0:
                    self.log.debug("Remove first tool change: {}".format(gcode.last_match))
                    self.layers[0].delete_line(index)
                break
            elif gcode.is_extrusion_move(cmd):
                # if print move before tool change, bail out. Tool change cannot be removed
                break

        # update extruder coasting value
        try:
            coasting = self.settings.get_hw_config_float_value("post.tower.coast")
            if coasting:
                for e in self.extruders:
                    self.extruders[e].coasting += coasting
        except TypeError:
            pass

    def open_file(self, gcode_file):
        """ Read given g-code file into list """
        self.gcode_file = gcode_file
        # open file
        try:
            gf = open(gcode_file, 'rb')
        except Exception as e:
            self.log.exception("Cannot open file %s" % gcode_file)
            return 1

        # remove extra EOL and empty lines
        self.lines = [l.strip() for l in gf.readlines() if l.strip()]
        gf.close()
        self.parse_version()
        self.parse_gcode()

    def read_all_lines(self):
        """
        Read lines from all layers
        :return: list of lines
        """
        lines = self.add_tool_change_gcode_post()
        for line in lines:
            yield gcode.format_to_string(*line)

    def save_new_file(self):
        """
        Save g-code lines into new file
        :return: new file path
        """
        #self.remove_comments()
        _dir, f_name = os.path.split(self.gcode_file)
        name, ext = os.path.splitext(f_name)
        new_file = os.path.join(_dir,  name + "_fs" + ext)
        try:
            with open(new_file, "wb") as nf:
                result = b"\r\n".join(self.read_all_lines())
                nf.write(result)
                return new_file
        except Exception as e:
            self.log.exception("Could not save file, error: %s" % e)
            return 1

    def get_extruders(self):
        """ Implement this in slicer specific implementation"""
        raise NotImplementedError()

    def check_layer_change(self, line, current_layer):
        """
        Implement this in slicer specific implementation
        :param line: g-code line to check
        :param current_layer: current layer object
        :return: old or updated layer data
        """
        raise NotImplementedError()
    
    def prerun_prime(self):
        """
        Prime each tool in reverse order
        :return: priming gcode to be inserted after start gcode
        """
                
    def find_tower_position(self):
        """
        Find proper position for the switch tower
        :return:
        """
        self.switch_tower = SwitchTower(self.log, self.settings, self.max_slots, self.min_layer_h)
        x = []
        y = []

        for layer in self.layers:
            index = 0
            for cmd, _ in layer.lines:
                if not cmd or (isinstance(layer, FirstLayer) and index < layer.start_gcode_end):
                    continue
                if layer.z > self.last_switch_height:
                    break
                if gcode.is_extrusion_move(cmd):
                    if gcode.last_match[0] is not None:
                        x.append(gcode.last_match[0])
                    if gcode.last_match[1] is not None:
                        y.append(gcode.last_match[1])
                index += 1

        x_max = max(x)
        y_max = max(y)
        x_min = min(x)
        y_min = min(y)
        self.log.debug("Xmax: %s, Ymax: %s, Xmin: %s, Ymin: %s" % (x_max, y_max, x_min, y_min))

        self.switch_tower.find_tower_position(x_max, x_min, y_max, y_min)

    @staticmethod
    def _get_retract_position(pos, new_pos):
        """
        Update E position value. In case of negative value we want to have
        cumulative status to understand how much retraction is done. In case of positive
        value we don't care, so 0 is ok.
        :param pos: current position
        :param new_pos: new position
        :return: updated position
        """
        pos += new_pos
        if pos > -0.00001:
            pos = 0
        return pos

    def add_tool_change_gcode(self):
        """
        Go through the g-code and add tool change g-code where needed.
        For layers that don't have tool change, add g-code for sparse infill.
        :return:
        """
        e_pos = 0
        is_tool_change = False

        # flag to indicate if z-move is needed after tower g-code
        z_move_needed = False
        # flag to indicate if prime is needed after purge tower g-code
        prime_needed = False
        # flag for post-tower prime
        prime_ok = False

        # Keep track of last X, Y position
        last_pos = None
        fan_speed = 0


            
        for layer in self.filtered_layers:
            if isinstance(layer, FirstLayer):
                index = layer.start_gcode_end
            else:
                index = 0
            self.log.debug("layer {}, e-pos {}, line-index {}".format(layer.num, e_pos, index))

            while True:
                try:
                    # TODO: refactor this whole thing...
                    cmd, comment = layer.lines[index]

                    if comment and comment.strip() == b"TOOL CHANGE":
                        is_tool_change = True
                    if not cmd:
                        # need command
                        index += 1
                        continue
                    if gcode.is_z_move(cmd):
                        z_move_needed = False
                    elif gcode.is_fan_speed(cmd):
                        fan_speed = gcode.last_match
                    elif is_tool_change and layer.action == ACT_SWITCH and gcode.is_tool_change(cmd) is not None:

                        layer.delete_line(index)

                        new_tool = gcode.last_match

                        # check if tool change is needed
                        if self.active_e is not None and self.active_e.tool == new_tool:
                            self.log.debug("Redundant tool change {}, skipping...".format(new_tool))
                        else:
                            # disable fan
                            if fan_speed:
                                index += layer.insert_line(index, gcode.gen_fan_off_gcode(), b"disable fan")
                            # add tool change g-code
                            # first check if retract is needed
                            retract = self.active_e.get_retract_gcode(change=e_pos, comment=b" pre-tower retract")
                            if retract:
                                index += layer.insert_line(index, *retract)
                                e_pos = -self.active_e.retract

                            new_e = self.extruders[new_tool]
                            for line in self.switch_tower.get_tower_lines(layer, e_pos, self.active_e, new_e):
                                if line:
                                    index += layer.insert_line(index, line[0], line[1])
                            prime_needed = True
                            prime_ok = False
                            self.active_e = new_e
                            # always full retract after purge tower
                            e_pos = -new_e.retract
                            z_move_needed = True

                            if fan_speed:
                                index += layer.insert_line(index, gcode.gen_fan_speed_gcode(fan_speed), b"restore fan")

                        is_tool_change = False
                        continue
                    elif gcode.is_extruder_move(cmd):
                        if prime_needed and gcode.last_match[0] < 0:
                            # remove retracts after adding tower
                            layer.delete_line(index)
                            index -= 1
                        elif prime_needed and not prime_ok:
                            # no prime allowed before moving to position
                            layer.delete_line(index)
                            index -= 1
                        else:
                            # store extruder position
                            e_pos = self._get_retract_position(e_pos, gcode.last_match[0])
                    elif gcode.is_extrusion_move(cmd):
                        # add prime if needed
                        if prime_needed:
                            if not prime_ok:
                                # if not in position, add move before prime
                                x = last_pos[0]
                                y = last_pos[1]
                                index += layer.insert_line(index, gcode.gen_head_move(x, y,
                                                                                      self.settings.travel_xy_speed),
                                                            b' update position')
                            # reset prime flag when printing starts after tower
                            prime_needed = False
                            if e_pos < -self.active_e.minimum_extrusion:
                                prime_change_len = -(e_pos + self.active_e.retract)
                                index += layer.insert_line(index,
                                                           *self.active_e.get_prime_gcode(change=prime_change_len))
                                e_pos = 0

                        # store extruder position
                        e_pos = self._get_retract_position(e_pos, gcode.last_match[3])

                        # add z move if needed
                        if z_move_needed:
                            index += layer.insert_line(index, gcode.gen_z_move(layer.z, self.settings.travel_z_speed))
                            z_move_needed = False

                        last_pos = gcode.last_match

                    elif gcode.is_head_move(cmd):
                        if prime_needed:
                            prime_ok = True
                        last_pos = gcode.last_match
                        if last_pos[2]:
                            z_move_needed = False

                except IndexError:
                    # if last layer for z, check infill
                    if layer.last_z_layer and layer.z < self.last_switch_height and not layer.support_layer:
                        added = False
                        for line in self.switch_tower.check_infill(layer, e_pos, self.active_e):
                            if line:
                                added = True
                                index += layer.insert_line(index, line[0], line[1])
                        if added:
                            e_pos = -self.active_e.retract
                        prime_needed = True
                        prime_ok = False
                    break
                index += 1

    def add_tool_change_gcode_post(self):
        """
        Run post steps for the layers, without the layer-object structuring. This should be run before saving
        to file, after adding tool changes
        :return: processed lines
        """

        lines = []
        for layer in self.layers:
            for cmd, comment in layer.lines:
                lines.append((cmd, comment))

        # tower retractions to proper place. This is hard to do in main tool change add loop as it's cumbersome to
        # modify previous layer objects...
        index = 0
        last_pos_index = -1
        while True:
            try:
                cmd, comment = lines[index]
                if cmd:
                    if gcode.is_head_move(cmd) or gcode.is_extrusion_move(cmd):
                        last_pos_index = index
                if comment == b" pre-tower retract":
                    if last_pos_index != -1:
                        new_pos = last_pos_index+1
                        if index != new_pos:
                            lines.pop(index)
                            lines.insert(last_pos_index+1, (cmd, comment))
            except IndexError:
                break
            index += 1

        return lines

    def parse_layers(self, lines):
        """
        Go through the g-code and find layer start points.
        Store each layer to list.
        :return:
        """
        raise NotImplementedError()

    def filter_layers(self):
        """
        Filter layers so that only layers relevant purge tower processing
        are returned. Also layers are tagged for action (tool witch, infill, pass)
        Layers that are left out:
        - empty (no command lines)
        - non-tool
        :return: none
        """

        layer_data = {}

        # step 1: parse z heights and populate dictionary with layers per z height
        for layer in self.layers:
            if layer.z not in layer_data:
                layer_data[layer.z] = {'layers': []}

            layer_data[layer.z]['layers'].append(layer)

        # z-list sorted
        zs = sorted(layer_data.keys())

        # get needed slot counts per layer by going through reversed z-position list.
        slots = 0
        zs.reverse()
        for z in zs:
            lrs = 0
            for l in layer_data[z]['layers']:
                # each layer counts whether there's tool changes or not
                lrs += l.has_tool_changes()
            if lrs > slots:
                slots = lrs
            layer_data[z]['slots'] = slots

        self.max_slots = slots
        # print(self.max_slots)

        # find tool change layers
        zs.reverse()
        for z in zs:

            current_slot = layer_data[z]['slots'] - 1

            # check tool change layers
            for l in layer_data[z]['layers']:
                l.slots = layer_data[z]['slots']
                if l.has_tool_changes():
                    l.action = ACT_SWITCH
                    l.tower_slot = current_slot
                    current_slot -= 1

            # mark last layer for curret z
            layer_data[z]['layers'][-1].last_z_layer = True

        # step 3: pack groups to list
        layers = []
        for z in zs:
            for l in layer_data[z]['layers']:
                layers.append(l)
        self.filtered_layers = sorted(layers, key=lambda x: x.num)

    def process(self, gcode_file):
        """ Runs processing """
        raise NotImplementedError()

    def print_summary(self):
        """
        Print summary info about the print
        :return:
        """
        self.log.info("Gcode succesfully processed.")
        if self.settings.get_hw_config_value("prerun.prime") == "True":
            self.log.info("Before print: make sure all extruders are UNLOADED")
        else:
            self.log.info("Before print: make sure T0 has filament LOADED")

    def parse_version(self):
        """
        Parse version of slicer from gccode file
        :return:
        """
        raise NotImplementedError()

    def parse_gcode_pass1(self):

        self.layers = OrderedDict()

        current_z = 0
        last_print_z = None

        current_x = 0
        current_y = 0
        last_extrusion_x = None
        last_extrusion_y = None

        current_tool = None

        add_tool = False

        self._retracts = {}

        e_pos = 0
        e_speed = 0

        # find z-heights and tool changes
        for line in self.lines:
            cmd, comment = gcode.read_gcode_line(line)
            if comment and comment.strip() == b"END SCRIPT START":
                break
            if not cmd:
                continue
            if gcode.is_tool_change(cmd) is not None:
                current_tool = gcode.last_match
                if not current_tool in self.tools:
                    self.tools.append(current_tool)
                add_tool = True
                e_pos = 0

            elif gcode.is_z_move(cmd):
                # get z position
                current_z = round(gcode.last_match[0], 5)

            elif gcode.is_extruder_move(cmd):
                e_pos = self._get_retract_position(e_pos, gcode.last_match[0])
                e_speed = gcode.last_match[1]

            elif gcode.is_head_move(cmd):
                # also check z from head move
                if gcode.last_match[2] is not None:
                    current_z = round(gcode.last_match[2], 5)
                current_x = gcode.last_match[0]
                current_y = gcode.last_match[1]

                # add negative e position list and reset e position
                if e_pos < 0:
                    if not current_tool in self._retracts:
                        self._retracts[current_tool] = []
                    self._retracts[current_tool].append((e_pos, e_speed))
                    e_pos = 0

            elif gcode.is_extrusion_move(cmd):

                # print move defines the actual z-height for tool
                last_print_z = current_z
                if last_print_z not in self.layers:
                    self.layers[last_print_z] = []

                # add tool to layer list if flag is set
                if add_tool:
                    if not current_tool in self.extruders:
                        # add new extruder instance, if one doesn't exist already
                        self.extruders[current_tool] = Extruder(current_tool)
                        self.extruders[current_tool].nozzle = self.settings.get_hw_config_float_value(
                            "tool.nozzle.diameter")
                        self.extruders[current_tool].z_hop = self.settings.get_hw_config_float_value(
                            "tool.tower.zhop")
                    self.layers[last_print_z].append(current_tool)
                    self.tool_switch_heights[current_tool] = last_print_z
                    add_tool = False

                e_pos = self._get_retract_position(e_pos, gcode.last_match[3])

                # update x and y pos (not used at the moment)
                if gcode.last_match[0] is not None:
                    current_x = gcode.last_match[0]

                if gcode.last_match[1] is not None:
                    current_y = gcode.last_match[1]

                if last_extrusion_x is not None and last_extrusion_y is not None and current_tool:
                    path_len = gcode.calculate_path_length((last_extrusion_x, last_extrusion_y), (current_x, current_y))
                    e_rate = gcode.calculate_feed_rate(path_len, gcode.last_match[3])
                    # e rate calculation not used currently
                    #current_tool.e_rates.append(e_rate)

                if gcode.last_match[0] is not None:
                    last_extrusion_x = gcode.last_match[0]

                if gcode.last_match[1] is not None:
                    last_extrusion_y = gcode.last_match[1]

        self.last_switch_height = max(self.tool_switch_heights.values())
        self._calculate_retractions()

    def parse_gcode_pass2(self):

        # create tower instances
        t_max = 0
        for z in self.layers:
            t_index = 0
            for tool in self.layers[z]:
                if not t_index in self.towers:
                    self.towers[t_index] = Tower()
                self.towers[t_index].add(z, tool)
                t_index += 1
            if t_index > t_max:
                t_max = t_index

    def parse_gcode_pass3(self):

        max_infill_h = self.settings.get_hw_config_float_value("tool.nozzle.diameter") * 0.625

        # find gaps in z list and fill them with infill (-1). Use aproximate layer h
        for tower in self.towers:
            prev_z = 0
            z_list = sorted(self.towers[tower].z)
            for z in z_list:
                if z - prev_z - max_infill_h > max_infill_h:
                    gap = z - prev_z - max_infill_h
                    infills = int(math.ceil(gap / max_infill_h))
                    if infills:
                        infill_h = gap / infills
                        for i in range(infills):
                            new_z = round(i * infill_h + z - gap, 2)
                            self.towers[tower].add(new_z, -1)
                prev_z = z

        # calculate min z h per tower
        for tower in self.towers:
            self.towers[tower].calculate_min_z()

    def _calculate_retractions(self):
        """
        Calculates retractions per tool
        :return:
        """
        for tool in self._retracts:
            self.extruders[tool].retract = abs(utils.percentile(self._retracts[tool], 0.99, key=lambda x: x[0]))
            self.extruders[tool].retract_speed = utils.percentile(self._retracts[tool], 0.99, key=lambda x: x[1])
            if self.extruders[tool].retract > 15 or self.extruders[tool].retract_speed > 10000:
                raise ValueError("Deducing retract values returned bad values: {} length, {} speed".format(
                    self.extruders[tool].retract, self.extruders[tool].retract_speed))

    def parse_gcode(self):
        """
        Parse needed settings from the gcode
        :return:
        """
        self.parse_gcode_pass1()
        self.parse_gcode_pass2()
