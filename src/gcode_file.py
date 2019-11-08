import math
import os
import types

from collections import OrderedDict
from pprint import pprint

import utils
from extruder import Extruder
from gcode import GCode

from switch_tower import SwitchTower
from preprime import PrePrime
from settings import Settings


gcode = GCode()


class ActionPoint:
    TOOL_CHANGE = 0
    INFILL = 1
    PREPRIME = 2
    LAYER_CHANGE = 3

    def __init__(self, action, data):
        if action != ActionPoint.TOOL_CHANGE and action != ActionPoint.INFILL and action != ActionPoint.PREPRIME \
                and action != ActionPoint.LAYER_CHANGE:
            raise ValueError("Bad actionpoint")
        self.action = action
        self.data = data


class Tower:
    """
    Class for storing tool change tower data
    """
    def __init__(self, min_z):
        self.z = {}
        self._min_z = min_z
        self.max_z_h = None

    def add(self, z, _type):
        if z not in self.z:
            self.z[z] = _type

    def calculate_min_z(self):
        prev_z = 0
        for z in sorted(self.z.keys()):
            z_h = round(z - prev_z, 5)
            if self._min_z is None or z_h < self._min_z:
                self._min_z = z_h
            prev_z = z

    @property
    def min_z(self):
        if not self._min_z:
            self.calculate_min_z()
        return self._min_z

    def get_tool_change_z(self):
        return [z for z in self.z if self.z[z] >= 0]


class Towers:

    def __init__(self, min_z, infill_checks):
        self.towers = {}
        self.min_z = min_z
        self.infill_checks = infill_checks

    def add_tower(self, _id, tower):
        self.towers[_id] = tower

    def get_tower_count(self, z):
        count = 0
        for _, t in self.towers.items():
            if z in t.z:
                count += 1
        return count

    def get_tower_by_id(self, _id):
        return self.towers.get(_id)

    def get_min_layer_h(self):

        # calculate min z h per tower
        min_layer_h = 10000
        for t in self.towers:
            if self.towers[t].min_z < min_layer_h:
                min_layer_h = self.towers[t].min_z
        return self.min_z

    def fill_gaps(self, max_infill_h, layers):
        # find gaps in z list and fill them with infill (-1). Use approximate layer h

        all_z_list = sorted(self.infill_checks)

        def find_z(start_z):
            zses = []
            for z in all_z_list:
                if z > start_z and z - start_z <= max_infill_h + 0.01:
                    zses.append(z)
            if zses:
                return max(zses)

        # make sure each tower has same initial z
        first_z = min(layers.keys())
        for tower in self.towers:
            if first_z not in self.towers[tower].z:
                self.towers[tower].add(first_z, -1)

        # find and fill gaps
        for tower in self.towers:
            prev_z = 0
            z_list = sorted(self.towers[tower].z)
            self.towers[tower].max_z_h = max_infill_h
            for z in z_list:
                gap = round(z - prev_z - max_infill_h, 5)
                if gap >= max_infill_h:
                    current_z = prev_z
                    while gap > 0.01:
                        new_z = find_z(current_z)
                        if not new_z:
                            break
                        gap -= round(new_z - current_z, 5)
                        self.towers[tower].add(new_z, -1)
                        current_z = new_z
                prev_z = z

    def get_tool_change_z(self):
        z_list = []
        for tower in self.towers:
            for z in self.towers[tower].get_tool_change_z():
                if not z in z_list:
                    z_list.append(z)
        return z_list

    def get_max_tower_count(self):
        return len(self.towers)

    def get_tower_id_by_z_and_tool(self, layer_z, tool):
        for t_id in self.towers:
            if layer_z in self.towers[t_id].z and tool == self.towers[t_id].z[layer_z]:
                return t_id


class GCodeFile:
    SLICER_CURA = "Cura"
    SLICER_KISSLICER = "KISSlicer"
    SLICER_SIMPLIFY3D = "Simplify3d"
    SLICER_SLIC3R = "Slic3r"
    SLICER_PRUSA_SLIC3R = "PrusaSlic3r"

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

        self.extruders = OrderedDict()
        self.switch_tower = None
        self.filtered_layers = []
        self.pr_index = None
        self.e_pos = 0
        self.infill_checks = []

        self.lines = None

        self.tool_switch_heights = {}
        self.last_switch_height = 0

        self.settings = settings
        self.log.info("HW config: %s" % self.settings.hw_config)

        # max slots needed
        self.max_slots = None

        # preprime handler
        self.preprime = None

        # currently active e
        self.active_e = None

        # min z height
        self.min_layer_h = None

        # Slicer version
        self.version = None

        self.towers = None

        self.start_gcode_start = None
        self.start_gcode_end = None

        self.x_max = None
        self.y_max = None
        self.x_min = None
        self.y_min = None

    def parse_header(self):
        """
        Parse header of gcode file, if any.
        Implement in slicer specific code

        """
        raise NotImplementedError()

    def add_line(self, cmd, comment=None):
        """
        Adds lines to line list
        :param cmd: g-code command or generator
        :param comment: comment
        :return: number of lines added
        """
        if isinstance(cmd, types.GeneratorType):
            lines = 0
            for c in cmd:
                if isinstance(c, tuple):
                    self.lines.append(c)
                else:
                    self.lines.append((c, comment))
                lines += 1
            return lines
        else:
            self.lines.append((cmd, comment))
            return 1

    def insert_line(self, index, cmd, comment=None):
        """
        Insert line to given index position
        :param index: index
        :param cmd: g-code command or generator
        :param comment: g-code comment
        :return: number of lines inserted
        """
        if isinstance(cmd, types.GeneratorType):
            i = index
            lines = 0
            for c in cmd:
                if isinstance(c, tuple):
                    self.lines.insert(i, c)
                else:
                    self.lines.insert(i, (c, comment))
                i += 1
                lines += 1
            return lines
        else:
            self.lines.insert(index, (cmd, comment))
            return 1

    def prerun_prime(self, index):
        """
        Check if pre-run prime is enabled and add the gcode if needed
        :return:
        """
        if self.settings.get_hw_config_value("prerun.prime") == "True":
            self.log.debug("Preprime enabled")
            self.preprime = PrePrime(self.log, self.settings, self.max_slots, self.extruders)
            for cmd, comment in self.preprime.get_prime_lines():
                if cmd is not None or comment is not None:
                    self.insert_line(index, cmd, comment)
                    index += 1
            self.active_e = self.extruders[self.preprime.last_tool]
        else:
            self.log.info("No pre-prime run")
            self.active_e = self.extruders[0]
        return index

    def open_file(self, gcode_file):
        """
        Read given g-code file into list
        :param gcode_file: path to gcode file
        :return None
        """
        self.gcode_file = gcode_file
        # open file
        try:
            gf = open(gcode_file, 'rb')
        except Exception as e:
            self.log.exception("Cannot open file %s" % gcode_file)
            return 1

        # remove extra EOL and empty lines, convert to cmd, comment tuple
        self.lines = [gcode.read_gcode_line(l.strip()) for l in gf.readlines() if l.strip()]
        gf.close()

    def read_all_lines(self):
        """
        Read lines from all layers
        :return: list of lines
        """
        for line in self.lines:
            yield gcode.format_to_string(*line)

    def save_new_file(self):
        """
        Save g-code lines into new file
        :return: new file path
        """
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

    def find_model_limits(self):
        """
        Find x and y min and max coordinates
        :return:
        """

        x = []
        y = []

        index = 0
        current_z = 0
        for cmd, _ in self.lines:
            if type(cmd) == bytes and index > self.start_gcode_end:
                # get z position
                if gcode.is_z_move(cmd):
                    current_z = round(gcode.last_match[0], 5)
                # head move. Check z position
                elif gcode.is_head_move(cmd):
                    if gcode.last_match[2] is not None:
                        current_z = round(gcode.last_match[2], 5)
                elif gcode.is_extrusion_move(cmd):
                    if current_z > self.last_switch_height:
                        break
                    if gcode.last_match[0] is not None:
                        x.append(gcode.last_match[0])
                    if gcode.last_match[1] is not None:
                        y.append(gcode.last_match[1])
            index += 1

        self.x_max = max(x)
        self.y_max = max(y)
        self.x_min = min(x)
        self.y_min = min(y)
        self.log.debug("Xmax: %s, Ymax: %s, Xmin: %s, Ymin: %s" % (self.x_max, self.y_max, self.x_min, self.y_min))

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

        self.switch_tower = SwitchTower(self.log, self.settings, self.towers)
        self.switch_tower.find_tower_position(self.x_max, self.x_min, self.y_max, self.y_min)

        self.e_pos = 0
        # flag to indicate if z-move is needed after tower g-code
        z_move_needed = False
        # flag to indicate if prime is needed after purge tower g-code
        prime_needed = False
        # flag for post-tower prime
        prime_ok = False
        # flag to check head move parameters
        head_check_needed = False

        # Keep track of last X, Y position
        last_pos = None
        fan_speed = 0

        z_pos = 0  # head position

        index = self.start_gcode_end

        layer_nr = 0

        while True:
            try:
                cmd, comment = self.lines[index]

                if not cmd:
                    # need command
                    index += 1
                    continue
                if type(cmd) == ActionPoint:

                    # delete command
                    self.lines.pop(index)

                    if cmd.action == ActionPoint.TOOL_CHANGE:
                        # tool change
                        current_z = cmd.data[0]
                        new_tool = cmd.data[1]

                        # check if tool change is needed
                        if self.active_e is not None and self.active_e.tool == new_tool:
                            self.log.debug("Redundant tool change {}, skipping...".format(new_tool))
                        else:
                            # disable fan
                            if fan_speed and self.settings.tower_fan_off:
                                index += self.insert_line(index, gcode.gen_fan_off_gcode(), b"disable fan")

                            # add tool change g-code
                            # first check if retract is needed
                            retract = self.active_e.get_retract_gcode(change=self.e_pos, comment=b" pre-tower retract")
                            if retract:
                                index += self.insert_line(index, *retract)
                                self.e_pos = -self.active_e.retract

                            new_e = self.extruders[new_tool]

                            for line in self.switch_tower.get_tower_lines(current_z, self.e_pos, self.active_e,
                                                                          new_e, layer_nr):
                                if line:
                                    index += self.insert_line(index, line[0], line[1])
                            prime_needed = True
                            prime_ok = False
                            self.active_e = new_e
                            # always full retract after purge tower
                            self.e_pos = -new_e.retract
                            z_move_needed = True
                            head_check_needed = True

                            if fan_speed and self.settings.tower_fan_off:
                                index += self.insert_line(index, gcode.gen_fan_speed_gcode(fan_speed), b"restore fan")
                        continue
                    elif cmd.action == ActionPoint.INFILL:
                        # tower infill
                        prev_index = index
                        for line in self.switch_tower.check_infill(cmd.data, self.e_pos, self.active_e):
                            if line:
                                index += self.insert_line(index, line[0], line[1])
                        if index > prev_index:
                            z_move_needed = True
                            prime_needed = True
                            prime_ok = False
                            head_check_needed = True
                            # always full retract after infill
                            self.e_pos = -self.active_e.retract
                        continue
                    elif cmd.action == ActionPoint.PREPRIME:
                        index = self.prerun_prime(index)
                        continue
                    elif cmd.action == ActionPoint.LAYER_CHANGE:
                        layer_nr = cmd.data
                        continue
                elif gcode.is_z_move(cmd):
                    z_pos = round(gcode.last_match[0], 5)
                    z_move_needed = False
                elif gcode.is_fan_speed(cmd):
                    fan_speed = gcode.last_match
                elif gcode.is_extruder_move(cmd):
                    if prime_needed and gcode.last_match[0] < 0:
                        # remove retracts after adding tower
                        self.lines.pop(index)
                        index -= 1
                    elif prime_needed and not prime_ok:
                        # no prime allowed before moving to position
                        self.lines.pop(index)
                        index -= 1
                    else:
                        # store extruder position
                        self.e_pos = self._get_retract_position(self.e_pos, gcode.last_match[0])
                elif gcode.is_extrusion_move(cmd):
                    # add prime if needed
                    current_z = z_pos
                    if prime_needed:
                        if not prime_ok:
                            # if not in position, add move before prime
                            x = last_pos[0]
                            y = last_pos[1]
                            index += self.insert_line(index, gcode.gen_head_move(x, y, self.settings.travel_xy_speed),
                                                      b' update position')
                            head_check_needed = False
                        # reset prime flag when printing starts after tower
                        prime_needed = False
                        if self.e_pos < -self.active_e.minimum_extrusion:
                            prime_change_len = -(self.e_pos + self.active_e.retract)
                            index += self.insert_line(index, *self.active_e.get_prime_gcode(change=prime_change_len))

                            self.e_pos = 0

                    # store extruder position
                    self.e_pos = self._get_retract_position(self.e_pos, gcode.last_match[3])

                    # add z move if needed
                    if z_move_needed:
                        index += self.insert_line(index, gcode.gen_z_move(current_z,
                                                                          self.settings.travel_z_speed))
                        z_move_needed = False

                    last_pos = gcode.last_match

                elif gcode.is_head_move(cmd):
                    # head move before prime -> clear flag
                    if prime_needed:
                        prime_ok = True
                    last_pos = gcode.last_match
                    # z also moves
                    if last_pos[2]:
                        z_pos = round(last_pos[2], 5)
                        z_move_needed = False
                    # check that head move is sane after tool change
                    if head_check_needed:
                        head_check_needed = False
                        if not gcode.last_match[3] or gcode.last_match[3] < self.settings.travel_xy_speed or last_pos[2]:
                            self.lines[index] = gcode.gen_head_move(gcode.last_match[0], gcode.last_match[1], self.settings.travel_xy_speed), b" fixed travel"
                            if last_pos[2]:
                                index += self.insert_line(index+1, gcode.gen_z_move(last_pos[2], self.settings.travel_z_speed))

            except IndexError:
                break
            index += 1

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

        self._layers = OrderedDict()

        current_z = 0
        last_print_z = 0
        last_up_z_index = 0

        head_move_index = None

        current_x = 0
        current_y = 0
        last_extrusion_x = None
        last_extrusion_y = None

        current_tool = None
        current_tool_temp = None
        tool_index = 0

        add_tool = False

        self._retracts = {}
        self._z_speeds = []
        self._travel_speeds = []
        self._temperatures = {}

        e_pos = 0
        e_speed = 0

        layer_nr = 0

        # find z-heights and tool changes
        index = 0
        while True:
            try:
                cmd, comment = self.lines[index]
            except IndexError:
                break

            if comment:
                if comment.strip() == b"END SCRIPT START":
                    break
                elif comment.strip() == b"START SCRIPT END":
                    self.start_gcode_end = index
                    index += 1
                    self.insert_line(index, ActionPoint(ActionPoint.PREPRIME, None))
                elif comment.strip() == b"START SCRIPT START":
                    self.start_gcode_start = index

            # need command and one that's not in start gcode section
            if cmd is None:
                index += 1
                continue
            elif self.start_gcode_start is not None and self.start_gcode_end is None:
                in_start_gcode = True
            else:
                in_start_gcode = False

            # temperature parsing
            if gcode.is_temp_nowait(cmd) or gcode.is_temp_nowait_tool(cmd) or \
                    gcode.is_temp_wait(cmd) or gcode.is_temp_wait_tool(cmd):
                if gcode.last_match[0] == 0:
                    # remove temperature changes to 0 during print. Cura does these, not good for single nozzle setups
                    self.lines.pop(index)
                    continue
                try:
                    tool = gcode.last_match[1]
                except IndexError:
                    tool = current_tool or 0
                if tool not in self._temperatures:
                    self._temperatures[tool] = {}
                self._temperatures[tool][layer_nr] = gcode.last_match[0]

            # find linear advance/pressure advance commands
            elif gcode.is_lin_advance(cmd) and gcode.last_match != 0:
                self.settings.linear_advance = gcode.last_match
            elif gcode.is_pressure_advance(cmd) and gcode.last_match != 0:
                self.settings.pressure_advance = gcode.last_match

            if in_start_gcode:
                # skip rest of the parsing if in start gcode
                index += 1
                continue

            # tool change
            elif gcode.is_tool_change(cmd) is not None:
                current_tool = gcode.last_match
                add_tool = True
                tool_index = index
                # reset e position
                e_pos = 0

            # get z position
            elif gcode.is_z_move(cmd):
                prev_z = current_z
                current_z = round(gcode.last_match[0], 5)
                if round(current_z - prev_z, 5) > 0:
                    # if z move is up, store index
                    last_up_z_index = index
                if gcode.last_match[1]:
                    # store speed to list
                    self._z_speeds.append(round(gcode.last_match[1], 5))

            # get extruder position
            elif gcode.is_extruder_move(cmd):
                e_speed = gcode.last_match[1]
                if e_speed is not None:
                    e_pos = self._get_retract_position(e_pos, gcode.last_match[0])

            # head move. Check z position and store extruder position to retract list
            elif gcode.is_head_move(cmd):
                # also check z from head move
                if gcode.last_match[2] is not None:
                    prev_z = current_z
                    current_z = round(gcode.last_match[2], 5)
                    if round(current_z - prev_z, 5) > 0:
                        last_up_z_index = index
                current_x = gcode.last_match[0]
                current_y = gcode.last_match[1]
                if gcode.last_match[3]:
                    self._travel_speeds.append(round(gcode.last_match[3]))

                # add negative e position list and reset e position
                if e_pos < 0:
                    if not current_tool in self._retracts:
                        self._retracts[current_tool] = []
                    self._retracts[current_tool].append((e_pos, e_speed))
                    e_pos = 0

                head_move_index = index

            # extrusion i.e. print move
            if gcode.is_extrusion_move(cmd):
                # check z argument

                if gcode.last_match[2] is not None:
                    prev_z = current_z
                    current_z = round(gcode.last_match[2], 5)
                    if round(current_z - prev_z, 5) > 0:
                        # if z move is up, store index
                        last_up_z_index = index
                        # TODO: parse z speed

                # print move defines the actual z-height for tool
                if current_z not in self._layers:

                    self._layers[current_z] = []
                    if last_up_z_index is not None:
                        self.insert_line(last_up_z_index, ActionPoint(ActionPoint.LAYER_CHANGE, layer_nr))
                        index += 1
                        layer_nr += 1
                        if len(self._layers) > 1:
                            # add infill action with previous layer height
                            self.insert_line(last_up_z_index, ActionPoint(ActionPoint.INFILL, last_print_z))
                            self.infill_checks.append(last_print_z)
                            index += 1
                    last_up_z_index = None
                last_print_z = current_z

                # add tool to layer list if flag is set
                if add_tool:
                    if current_tool not in self.extruders:
                        # add new extruder instance, if one doesn't exist already
                        self.extruders[current_tool] = Extruder(current_tool)
                        self.extruders[current_tool].nozzle = self.settings.get_hw_config_float_value(
                            "tool.nozzle.diameter")
                        self.extruders[current_tool].z_hop = self.settings.get_hw_config_float_value(
                            "tool.tower.zhop")

                    # replace line with z and tool, if not the first extruder
                    if len(self.extruders.keys()) > 1:
                        self._layers[last_print_z].append(current_tool)
                        self.tool_switch_heights[current_tool] = last_print_z
                        self.lines[tool_index] = ActionPoint(ActionPoint.TOOL_CHANGE, (last_print_z, current_tool)), None
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

            index += 1

        if self.start_gcode_end is None:
            raise ValueError("Cannot find 'START SCRIPT END'-comment. Please add it to your Slicer's config")

        self.last_switch_height = max(self.tool_switch_heights.values())
        self._calculate_values()

        # update extruder coasting value
        try:
            coasting = self.settings.get_hw_config_float_value("post.tower.coast")
            if coasting:
                for e in self.extruders:
                    self.extruders[e].coasting += coasting
        except TypeError:
            pass

    def parse_gcode_pass2(self):
        # create tower instances

        min_z = None
        prev_z = 0
        for z in sorted(self._layers):
            z_h = round(z - prev_z, 5)
            if min_z is None or z_h < min_z:
                min_z = z_h
            prev_z = z

        if min_z < 0.1:
            min_z = 0.1

        self.towers = Towers(min_z, self.infill_checks)
        for z in self._layers:
            t_id = 0
            for tool in self._layers[z]:
                tower = self.towers.get_tower_by_id(t_id)
                if not tower:
                    tower = Tower(min_z)
                tower.add(z, tool)
                self.towers.add_tower(t_id, tower)
                t_id += 1

    def parse_gcode_pass3(self):

        max_infill_h = round(self.settings.get_hw_config_float_value("tool.nozzle.diameter") * 0.625, 5)
        self.towers.fill_gaps(max_infill_h, self._layers)

    def _calculate_values(self):
        """
        Calculates various values
        :return:
        """
        for tool in self._retracts:
            if tool in self.extruders:
                self.extruders[tool].retract = abs(utils.percentile(self._retracts[tool], 0.99, key=lambda x: x[0]))
                self.extruders[tool].retract_speed = utils.percentile(self._retracts[tool], 0.99, key=lambda x: x[1])
                if self.extruders[tool].retract > 15 or self.extruders[tool].retract_speed > 10000:
                    raise ValueError("Deducing retract values returned bad values: {} length, {} speed".format(
                        self.extruders[tool].retract, self.extruders[tool].retract_speed))

        for tool in self._temperatures:
            if tool in self.extruders:
                self.extruders[tool].temperature_setpoints = self._temperatures[tool]

        if self._z_speeds:
            self.settings.travel_z_speed = abs(utils.percentile(self._z_speeds, 0.99))

        if self._travel_speeds:
            self.settings.travel_xy_speed = abs(utils.percentile(self._travel_speeds, 0.99))

    def parse_gcode(self):
        """
        Parse needed settings from the gcode: tool change layers, extruder retracts, towers, tower infill layers...
        :return:
        """
        self.parse_gcode_pass1()
        self.parse_gcode_pass2()
        self.parse_gcode_pass3()
