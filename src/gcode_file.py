import os

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

        if self.settings.purge_lines > 15:
            self.settings.purge_lines = 15
            
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

    def parse_header(self):
        """
        Parse header of gcode file, if any.
        Implement in slicer specific code

        """
        raise NotImplemented

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
                # find valid tool changes
                if comment and comment.strip() == b"TOOL CHANGE":
                    first_layer = isinstance(layer, FirstLayer)
                    if first_layer and index < layer.start_gcode_end:
                        continue
                    is_tool_change = True

                elif cmd:
                    # find linear advance commands
                    if is_tool_change and gcode.is_tool_change(cmd) is not None:
                        # add unique tools to list
                        if gcode.last_match not in self.tools:
                            self.tools.append(gcode.last_match)
                        self.tool_switch_heights[gcode.last_match] = layer.z
                    elif gcode.is_lin_advance(cmd) and gcode.last_match != 0:
                        self.settings.linear_advance = gcode.last_match
                    is_tool_change = False
                else:
                    is_tool_change = False

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
        lines = [l.strip() for l in gf.readlines() if l.strip()]
        gf.close()
        self.parse_layers(lines)

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
        raise NotImplemented

    def check_layer_change(self, line, current_layer):
        """
        Implement this in slicer specific implementation
        :param line: g-code line to check
        :param current_layer: current layer object
        :return: old or updated layer data
        """
        raise NotImplemented
    
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

    def add_tool_change_gcode(self):
        """
        Go through the g-code and add tool change g-code where needed.
        For layers that don't have tool change, add g-code for sparse infill.
        :return:
        """
        e_pos = 0
        is_tool_change = False

        # last z-position
        last_z = 0

        # flag to indicate if z-move is needed after tower g-code
        z_move_needed = False
        # flag to indicate if prime is needed after purge tower g-code
        prime_needed = False
        # flag for post-tower prime
        prime_ok = False

        # Keep track of last X, Y position
        last_pos = None

        def update_retract_position(pos, new_pos):
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
            
        for layer in self.filtered_layers:
            if isinstance(layer, FirstLayer):
                index = layer.start_gcode_end
            else:
                index = 0
            self.log.debug("layer {}, e-pos {}, line-index {}".format(layer.num, e_pos, index))

            while True:
                try:
                    # TODO: refactor this whole thing...
                    # when z height changes, check that tower height isn't too low versus layer
                    if layer.num != 1 and last_z < layer.z < self.last_switch_height:
                        added = False
                        for line in self.switch_tower.check_infill(layer, e_pos, self.active_e):
                            if line:
                                added = True
                                index += layer.insert_line(index, line[0], line[1])
                        if added:
                            e_pos = -self.active_e.retract
                        prime_needed = True
                        prime_ok = False

                    last_z = layer.z

                    # add infill the the beginning of the layer if not a tool change layer
                    if layer.action == ACT_INFILL and index == 0 and layer.num != 1 and layer.z < self.last_switch_height:
                        # update purge tower with sparse infill
                        added = False
                        for line in self.switch_tower.get_infill_lines(layer, e_pos, self.active_e):
                            if line:
                                added = True
                                index += layer.insert_line(index, line[0], line[1])
                        if added:
                            e_pos = -self.active_e.retract
                        prime_needed = True
                        prime_ok = False

                    cmd, comment = layer.lines[index]

                    if comment and comment.strip() == b"TOOL CHANGE":
                        is_tool_change = True
                    if not cmd:
                        # need command
                        index += 1
                        continue
                    if gcode.is_z_move(cmd):
                        z_move_needed = False
                    elif is_tool_change and layer.action == ACT_SWITCH and gcode.is_tool_change(cmd) is not None:

                        layer.delete_line(index)

                        new_tool = gcode.last_match

                        # check if tool change is needed
                        if self.active_e is not None and self.active_e.tool == new_tool:
                            self.log.debug("Redundant tool change {}, skipping...".format(new_tool))
                        else:
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
                            e_pos = update_retract_position(e_pos, gcode.last_match[0])
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
                        e_pos = update_retract_position(e_pos, gcode.last_match[3])

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
        raise NotImplemented

    def filter_layers(self):
        """
        Implement this in slicer specific implementation
        :return: none
        """
        raise NotImplemented

    def process(self, gcode_file):
        """ Runs processing """
        raise NotImplemented

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
