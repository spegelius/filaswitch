import os

from gcode import GCode
from layer import Layer, FirstLayer, ACT_PASS, ACT_INFILL, ACT_SWITCH
from switch_tower import SwitchTower


gcode = GCode()

SLICER_CURA = "Cura"
SLICER_KISSLICER = "KISSlicer"
SLICER_SIMPLIFY3D = "Simplify3d"
SLICER_SLIC3R = "Slic3r"


class GCodeFile:
    slicer_type = None

    def __init__(self, logger, hw_config, tower_position, purge_lines):
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

        # material switch z heights
        self.layer_height = None

        self.last_switch_heights = {}

        self.hw_config = hw_config
        self.log.info("HW config: %s" % self.hw_config)

        self.tower_position = tower_position
        self.purge_lines = int(purge_lines)
        if self.purge_lines > 15:
            self.purge_lines = 15

        self.tools = [0]

        self.travel_xy_speed = None
        self.travel_z_speed = None
        self.outer_perimeter_speed = None

        # machine limits. Populate these values in slicer specific implementations
        self.machine_type = None
        self.stroke_x = None
        self.stroke_y = None
        self.origin_offset_x = None
        self.origin_offset_y = None

        # max slots needed
        self.max_slots = None

    def parse_header(self):
        """
        Parse header of gcode file, if any.
        Implement in slicer specific code

        """
        raise NotImplemented

    def parse_print_settings(self):
        """ Parse print settings """

        is_tool_change = False
        for cmd, comment, index in self.layers[0].read_lines():

            if comment and comment.strip() == b"START SCRIPT END":
                self.layers[0].start_gcode_end = index
                break

        for layer in self.layers:
            for cmd, comment, index in layer.read_lines():
                if comment and comment.strip() == b"TOOL CHANGE":
                    is_tool_change = True
                elif is_tool_change and gcode.is_tool_change(cmd) is not None:
                    # add unique tools to list
                    if gcode.last_match not in self.tools:
                        self.tools.append(gcode.last_match)
                    self.last_switch_heights[gcode.last_match] = layer.z
                    is_tool_change = False

        if not self.layers[0].start_gcode_end:
            raise ValueError("Cannot find 'START SCRIPT END'-comment. Please add it to your Slicer's config")

    def open_file(self, gcode_file):
        """ Read given g-code file into list """
        self.gcode_file = gcode_file
        # open file
        try:
            gf = open(gcode_file, 'rb')
        except Exception as e:
            self.log.error("Cannot open file %s" % gcode_file)
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
            for cmd, comment in layer.lines:
                yield gcode.format_to_string(cmd, comment)

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
            self.log.error("Could not save file, error: %s" % e)
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

    def find_tower_position(self):
        """
        Find proper position for the switch tower
        :return:
        """
        self.switch_tower = SwitchTower(self.log, self.hw_config, self.tower_position, self.max_slots,  self.purge_lines)
        x = []
        y = []

        for layer in self.layers:
            for cmd, _ in layer.lines:
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
        self.log.debug("Xmax: %s, Ymax: %s, Xmin: %s, Ymin: %s" % (x_max, y_max, x_min, y_min))

        self.switch_tower.find_tower_position(x_max, x_min, y_max, y_min, self.machine_type, self.stroke_x,
                                              self.stroke_y, self.origin_offset_x, self.origin_offset_y)

    def add_switch_raft(self):
        """
        Add tower raft gcode lines after start gcode
        :return:
        """
        # TODO: check for retraction
        index = self.layers[0].start_gcode_end + 1
        for cmd, comment in self.switch_tower.get_raft_lines(self.layers[0], self.extruders[0], False,
                                                             self.travel_xy_speed, self.travel_z_speed):
            index += self.layers[0].insert_line(index, cmd, comment)
        self.layers[0].start_gcode_end = index

    def add_tool_change_gcode(self):
        """
        Go through the g-code and add tool change g-code where needed.
        For layers that don't have tool change, add g-code for sparse infill.
        :return:
        """
        e_pos = 0
        z_speed = 0
        z_hop = 0
        active_e = self.extruders[0]
        # flag to indicate if prime is needed after purge tower g-code
        prime_needed = False
        is_tool_change = False

        def update_retract_position(pos, new_pos):
            """
            Update E position value. In case of negative value we want to have
            cumulative status to understand how much retraction is done. In case of positive
            value we don't care, so 0 i ok.
            :param pos: current position
            :param new_pos: new position
            :return: updated position
            """
            pos += new_pos
            if pos > -0.00001:
                pos = 0
            return pos

        for layer in self.filtered_layers:
            index = 0
            #print("layer", layer.num, e_pos)
            while True:
                try:
                    # add infill the the beginning of the layer if not a tool change layer
                    if layer.action == ACT_INFILL and index == 0 and layer.num != 1:
                        # update purge tower with sparse infill
                        for cmd, comment in self.switch_tower.get_infill_lines(layer, e_pos, active_e, z_hop,
                                                                               self.travel_z_speed,
                                                                               self.travel_xy_speed):
                            index += layer.insert_line(index, cmd, comment)

                    cmd, comment = layer.lines[index]

                    if comment and comment.strip() == b"TOOL CHANGE":
                        is_tool_change = True
                    if not cmd:
                        # need command
                        index += 1
                        continue

                    if gcode.is_z_move(cmd):
                        # store current z position and z-hop
                        current_z, z_speed = gcode.last_match
                        z_hop = current_z - layer.z
                    elif is_tool_change and layer.action == ACT_SWITCH and gcode.is_tool_change(cmd) is not None:
                        # add tool change g-code
                        new_e = self.extruders[gcode.last_match]
                        layer.delete_line(index)
                        for cmd, comment in self.switch_tower.get_tower_lines(layer, e_pos, active_e,
                                                                              new_e, z_hop, self.travel_z_speed,
                                                                              self.travel_xy_speed):
                            index += layer.insert_line(index, cmd, comment)
                        prime_needed = True
                        active_e = new_e
                        # always full retract after purge tower
                        e_pos = -new_e.retract
                        is_tool_change = False
                    elif gcode.is_extruder_move(cmd):
                        # store extruder position
                        e_pos = update_retract_position(e_pos, gcode.last_match[0])
                    elif gcode.is_extrusion_move(cmd) or gcode.is_extrusion_speed_move(cmd):
                        # store extruder position and add prime if needed
                        if prime_needed and e_pos < 0:
                            prime_change_len = -(e_pos + active_e.retract + 0.05)
                            index += layer.insert_line(index,
                                                       *active_e.get_prime_gcode(change=prime_change_len))
                            prime_needed = False
                            e_pos = 0
                        e_pos = update_retract_position(e_pos, gcode.last_match[2])

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
            current_layer.add_line(cmd, comment)

        # last layer
        self.layers.append(current_layer)

    def filter_layers(self):
        """
        Implement this in slicer specific implementation
        :return: none
        """
        raise NotImplemented

    def process(self, gcode_file):
        """ Runs processing """
        raise NotImplemented
