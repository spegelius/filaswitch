
import logging
import math
import os
import re
import statistics

import utils

from gcode import GCode
from layer import Layer, FirstLayer
from switch_tower import SwitchTower

log = logging.getLogger("filaswitch")

gcode = GCode()

SLICER_CURA = "Cura"
SLICER_KISSLICER = "KISSlicer"
SLICER_SIMPLIFY3D = "Simplify3d"
SLICER_SLIC3R = "Slic3r"


class GCodeFile:
    slicer_type = None

    def __init__(self, debug=False):
        self.debug = debug
        if debug:
            log.setLevel(logging.DEBUG)
        else:
            log.setLevel(logging.INFO)
        self.settings = {}
        self.gcode_file = None
        self.material = None
        self.extruders = {}
        self.switch_tower = None

        self.layers = []

        # material switch z heights
        self.layer_height = None

        self.last_switch_height = None

    def parse_header(self):
        """
        Parse header of gcode file, if any.
        Implement in slicer specific code

        """
        raise NotImplemented

    def parse_print_settings(self):
        """ Parse print settings """

        for line in self.layers[0].lines:

            if line[1] == b"START SCRIPT END":
                self.layers[0].start_gcode_end = line[2]
                break

        if not self.layers[0].start_gcode_end:
            raise ValueError("Cannot find 'START SCRIPT END'-comment. Please add it to your Slicer's config")

        for layer in self.layers:
            if layer.has_tool_changes():
                self.last_switch_height = layer.z

    def open_file(self, gcode_file):
        """ Read given g-code file into list """
        self.gcode_file = gcode_file
        # open file
        try:
            gf = open(gcode_file, 'rb')
        except Exception as e:
            log.error("Cannot open file %s" % gcode_file)
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
        for layer in self.layers:
            for cmd, comment, _ in layer.lines:
                yield gcode.format_to_string(cmd, comment)

    def save_new_file(self):
        """
        Save g-code lines into new file
        :return: new file path
        """
        #self.remove_comments()
        _dir, fname = os.path.split(self.gcode_file)
        name, ext = os.path.splitext(fname)
        newfile = os.path.join(_dir,  name + "_fs" + ext)
        try:
            with open(newfile, "wb") as nf:
                result = b"\r\n".join(self.read_all_lines())
                nf.write(result)
                log.info("Wrote new file: %s" % newfile)
                return newfile
        except Exception as e:
            log.error("Could not save file, error: %s" % e)
            return 1

    def calculate_path_length(self, prev_position, new_position):
        """ Calculate path length from given coordinates"""
        x_len = prev_position[0] - new_position[0]
        y_len = prev_position[1] - new_position[1]

        path_len = math.sqrt((x_len * x_len) + (y_len * y_len))
        return path_len

    def calculate_extrusion_length(self, prev_position, new_position):
        """ Calculates extrusion length"""
        length = abs(prev_position - new_position)
        return length

    def calculate_feed_rate(self, path_len, extrusion_length):
        """ Calculates feed rate from path length vs. extrusion length"""
        if not path_len or not extrusion_length:
            return 0.005 # hat constant instead of 0 extrusion. Bug in Slic3r? TODO: check this
        rate = 1 / (path_len / extrusion_length)
        return rate

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

    def find_tower_position(self):
        """
        Find proper position for the switch tower
        :return:
        """
        x = []
        y = []

        for layer in self.layers:
            for cmd, _, _ in layer.lines:
                if not cmd:
                    continue
                ret = gcode.is_extrusion_move(cmd)
                if ret:
                    x.append(ret[0])
                    y.append(ret[1])

        x_max = max(x)
        y_max = max(y)
        x_min = min(x)
        y_min = min(y)

        log.debug("Xmax: %s, Ymax: %s, Xmin: %s, Ymin: %s" %(x_max, y_max, x_min, y_min))

        self.switch_tower = SwitchTower(x_min, y_max+5)
        # TODO: check against bed dimensions

    def add_switch_raft(self):
        """
        Add tower raft gcode lines after start gcode
        :return:
        """
        # TODO: check for retraction
        index = self.layers[0].start_gcode_end + 1
        for cmd, comment in self.switch_tower.get_raft_lines(self.extruders[0], False):
            self.layers[0].insert_line(index, cmd, comment)
            index += 1
        self.layers[0].start_gcode_end = index

    def add_tool_change_gcode(self):
        """
        Go through the g-code and add tool change g-code where needed.
        For layers that don't have tool change, add g-code for sparse infill.
        :return:
        """

        current_z = 0
        z_hop = 0
        e_pos = 0
        e_speed = 0
        z_speed = 0
        old_e = self.extruders[0]

        for layer in self.layers:

            if layer.z > self.last_switch_height:
                break

            index = 0
            while True:
                try:
                    cmd, comment, _ = layer.lines[index]
                    if not cmd:
                        index += 1
                        continue
                    if gcode.is_z_move(cmd):
                        current_z, z_speed = gcode.last_match
                    elif gcode.is_tool_change(cmd):
                        z_hop = current_z - layer.z
                        new_e = self.extruders[gcode.last_match]
                        layer.delete_line(index)
                        for cmd, comment in self.switch_tower.get_tower_lines(layer, e_pos, old_e, new_e, z_hop, z_speed):
                            layer.insert_line(index, cmd, comment)
                            index += 1
                    elif gcode.is_extruder_move(cmd):
                        e_pos = gcode.last_match[0]
                        e_speed = gcode.last_match[1]
                except IndexError:
                    break
                index += 1


    def parse_layers(self, lines):
        """
        Go through the g-code and find layer start points.
        Store each layer to list.
        :return:
        """
        prev_layer = None
        prev_height = 0
        current_layer = FirstLayer(1, 0.2, 0.2)
        line_index = 0
        for line in lines:
            cmd, comment = gcode.read_gcode_line(line)
            if comment:
                ret = self.check_layer_change(comment, None)
                if ret:
                    if current_layer.num == 1 and ret[0] == 1:
                        current_layer.z = ret[1]
                    else:
                        if prev_layer:
                            prev_z = prev_layer.z
                        else:
                            prev_z = 0

                        height = current_layer.z - prev_z
                        if height:
                            prev_height = height
                        else:
                            height = prev_height

                        self.layers.append(current_layer)
                        prev_layer = current_layer
                        current_layer = Layer(ret[0], ret[1], height)
                        line_index = 0
            current_layer.add_line(cmd, comment, line_index)
            line_index += 1

    def process(self, gcode_file):
        """ Runs processing """
        self.open_file(gcode_file)
        self.parse_header()
        self.get_extruders()
        self.parse_print_settings()
        self.find_tower_position()

        self.add_switch_raft()

        self.add_tool_change_gcode()
