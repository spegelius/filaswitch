import math

from gcode import GCode, E, S, W, N, NE, NW, SE, SW, TYPE_CARTESIAN, TYPE_DELTA

import utils

gcode = GCode()

# hw configs
PEEK = "PEEK-PRO-12"
PTFE = "PTFE-PRO-12"
PTFE4 = "PTFE-PRO-24"
E3DV6 = "PTFE-EV6"

HW_CONFIGS = [PTFE, E3DV6, PEEK]

AUTO = "Automatic"
LEFT = "Left"
RIGHT = "Right"
TOP = "Top"
BOTTOM = "Bottom"


TOWER_POSITIONS = [AUTO, LEFT, RIGHT, TOP, BOTTOM]

LINES = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
LINE_COUNT_DEFAULT = 6


class SwitchTower:

    def __init__(self, logger, hw_config, tower_position, max_slots,  purge_lines=LINE_COUNT_DEFAULT):
        """
        Filament switch tower functionality
        :param logger: Logger object
        :param config: system configuration (PEEK, PTFE, E3Dv6)
        :param max_slots: maximum number of tower slots
        :param purge_lines: amount of post purge lines
        """

        self.log = logger
        self.hw_config = hw_config
        self.max_slots = max_slots

        self.slot = 0
        self.slots = {}
        for i in range(self.max_slots):
            self.slots[i] = {}
            self.slots[i]['last_z'] = 0.0
            self.slots[i]['flipflop_purge'] = False
            self.slots[i]['flipflop_infill'] = False

        self.width = 50
        self.pre_purge_height = 4.9

        # post purge line config
        self.purge_line_length = self.width + 0.6
        self.purge_lines = purge_lines

        if self.hw_config == E3DV6:
            self.purge_lines -= 1
            self.pre_purge_height = 6.3

        self.height = self.pre_purge_height + self.purge_lines * 1.5

        self.tower_position = tower_position

        self.wall_width = self.width + 2.4
        self.wall_height = self.height + 1.0

        self.raft_width = self.width + 4.0
        self.raft_height = (self.wall_height) * self.max_slots + 2.0
        self.raft_layer_height = 0.2
        self.angle = 0

        # is prepurge position positive or negative
        self.prepurge_sign = 1

        self.start_pos_x = None
        self.start_pos_y = None

        self.raft_pos_x = None
        self.raft_pos_y = None

        # offset from model
        self.tower_offset = 5.0

        # total values in terms of space taken
        self.total_height = self.raft_height + self.tower_offset
        self.total_width = self.raft_width + 3
        self.extra_width = self.total_width - self.width

        # build volume mid points, populated in find tower-fuction
        self.x_mid = None
        self.y_mid = None

        # amount of room for difference between tower height and model height
        self.z_slack_max = 1.2
        self.last_z_position = 0.0

        self.E = E
        self.S = S
        self.W = W
        self.N = N
        self.NE = NE
        self.NW = NW
        self.SW = SW
        self.SE = SE

    def rotate_tower(self, direction):
        """
        Rotates coordinate system by given angle
        :param direction: angle (counter clockwise from East)
        :return:
        """
        self.E += direction
        self.S += direction
        self.W += direction
        self.N += direction
        self.NE += direction
        self.NW += direction
        self.SE += direction
        self.SW += direction

    def _cartesian_position(self, x_max, x_min, y_max, y_min, stroke_x,
                            stroke_y, origin_offset_x, origin_offset_y):
        """
        Find position for purge tower using cartesian limits
        :param x_max: print objects x max
        :param x_min: print objects x min
        :param y_max: print objects y max
        :param y_min: print objects y min
        :param stroke_x: bed width
        :param stroke_y: bed height
        :param origin_offset_x: origin x offset
        :param origin_offset_y: origin y offset
        :return:
        """
        # expect origin offset to be positive always
        bed_x_max = stroke_x - origin_offset_x
        bed_y_max = stroke_y - origin_offset_y

        bed_x_min = -origin_offset_x
        bed_y_min = -origin_offset_y


        # find a place that can accommodate the tower height
        if self.tower_position == AUTO:
            positions = [TOP, RIGHT, BOTTOM, LEFT]
        else:
            positions = [self.tower_position]

        for position in positions:
            # generate tower start positions and adjust tower position if it is out of the bed
            if position == LEFT:
                self.start_pos_x = x_min - self.tower_offset
                self.start_pos_y = self.y_mid - self.width / 2

                if self.start_pos_y < bed_y_min + 4:
                    self.start_pos_y = bed_y_min + 4

                elif self.start_pos_y > bed_y_max - self.total_width:
                    self.start_pos_y = bed_y_max - self.total_width

                if self.start_pos_x > bed_x_min + self.total_height:
                    self.rotate_tower(90)
                    return position

            elif position == RIGHT:
                self.start_pos_x = x_max + self.tower_offset
                self.start_pos_y = self.y_mid + self.width / 2

                if self.start_pos_y < bed_y_min + self.total_width:
                    self.start_pos_y = bed_y_min + self.total_width

                elif self.start_pos_y > bed_y_max - 4:
                    self.start_pos_y = bed_y_max - 4

                if self.start_pos_x < bed_x_max - self.total_height:
                    self.rotate_tower(270)
                    return position

            elif position == TOP:
                self.start_pos_x = self.x_mid - self.width / 2
                self.start_pos_y = y_max + self.tower_offset

                if self.start_pos_x < bed_x_min + 4:
                    self.start_pos_x = bed_x_min + 4

                elif self.start_pos_x > bed_x_max - self.total_width:
                    self.start_pos_x = bed_x_max - self.total_width

                if self.start_pos_y < bed_x_max - self.total_height:
                    self.rotate_tower(0)
                    return position

            elif position == BOTTOM:
                self.start_pos_x = self.x_mid + self.width / 2
                self.start_pos_y = y_min - self.tower_offset

                if self.start_pos_x < bed_x_min + self.total_width:
                    self.start_pos_x = bed_x_min + self.total_width

                elif self.start_pos_x > bed_x_max - 4:
                    self.start_pos_x = bed_x_max - 4

                if self.start_pos_y > bed_y_min + self.total_height:
                    self.rotate_tower(180)
                    return position

        if self.tower_position == AUTO:
            raise ValueError("Not enough space for the tower inside the bed!")
        raise ValueError("Not enough room for tower using selected position %s" % self.tower_position)

    def _delta_position(self, x_max, x_min, y_max, y_min, stroke_x,
                            stroke_y, origin_offset_x, origin_offset_y):
        """
        Find position for purge tower using delta limits
        :param x_max: print objects x max
        :param x_min: print objects x min
        :param y_max: print objects y max
        :param y_min: print objects y min
        :param stroke_x: bed width
        :param stroke_y: bed height
        :param origin_offset_x: origin x offset
        :param origin_offset_y: origin y offset
        :return:
        """

        # assume that bed is round and origin is at the center
        bed_r = stroke_x/2

        def check_coordinate(x, y):
            angle = math.atan(y / x)
            length = y / math.sin(angle)
            return abs(length) < bed_r

        # find a place that can accommodate the tower height
        if self.tower_position == AUTO:
            positions = [TOP, RIGHT, BOTTOM, LEFT]
        else:
            positions = [self.tower_position]

        for position in positions:

            # generate tower start positions and adjust tower position if it is out of the bed
            if position == TOP:
                # top
                y = y_max + self.total_height
                x1 = self.x_mid - self.total_width/2
                x2 = self.x_mid + self.total_width/2

                if check_coordinate(x1, y) and check_coordinate(x2, y):
                    self.start_pos_y = y_max + self.tower_offset
                    self.start_pos_x = x1 + self.extra_width/2
                    return position

                # x3 = -self.total_width/2
                # x4 = self.total_width/2
                # if check_coordinate(x3, y) and check_coordinate(x4, y):
                #     self.start_pos_y = y_max + self.tower_offset
                #     self.start_pos_x = x3 + self.extra_width/2
                #     return position

            elif position == RIGHT:
                x = x_max + self.total_height
                y1 = self.y_mid + self.total_width/2
                y2 = self.y_mid - self.total_width/2
                if check_coordinate(x, y1) and check_coordinate(x, y2):
                    self.start_pos_y = y1 - self.extra_width/2
                    self.start_pos_x = x_max + self.tower_offset
                    self.rotate_tower(270)
                    return position

                # y3 = self.total_width/2
                # y4 = -self.total_width/2
                # if check_coordinate(x, y3) and check_coordinate(x, y4):
                #     self.start_pos_y = y3 - self.extra_width/2
                #     self.start_pos_x = x_max + self.tower_offset
                #     self.rotate_tower(270)
                #     return position

            elif position == BOTTOM:
                y = y_min - self.total_height
                x1 = self.x_mid - self.total_width / 2
                x2 = self.x_mid + self.total_width / 2
                if check_coordinate(x1, y) and check_coordinate(x2, y):
                    self.start_pos_y = y_min - self.tower_offset
                    self.start_pos_x = x2 - self.extra_width/2
                    self.rotate_tower(180)
                    return position

                # x3 = -self.total_width / 2
                # x4 = self.total_width / 2
                # if check_coordinate(x3, y) and check_coordinate(x4, y):
                #     self.start_pos_y = y_min - self.tower_offset
                #     self.start_pos_x = x4 - self.extra_width/2
                #     self.rotate_tower(180)
                #     return position

            elif position == LEFT:
                x = x_min - self.total_height
                y1 = self.y_mid - self.total_width / 2
                y2 = self.y_mid = self.total_width / 2
                if check_coordinate(x, y1) and check_coordinate(x, y2):
                    self.start_pos_y = y1 + self.extra_width/2
                    self.start_pos_x = x_min - self.tower_offset
                    self.rotate_tower(90)
                    return position

                # y3 = -self.total_width / 2
                # y4 = self.total_width / 2
                # if check_coordinate(x, y3) and check_coordinate(x, y4):
                #     self.start_pos_y = y3 + self.extra_width/2
                #     self.start_pos_x = x_min - self.tower_offset
                #     self.rotate_tower(90)
                #     return position

        if self.tower_position == AUTO:
            raise ValueError("Not enough space for the tower inside the bed!")
        raise ValueError("Not enough room for tower using selected position %s" % self.tower_position)

    def find_tower_position(self, x_max, x_min, y_max, y_min, machine_type, stroke_x,
                            stroke_y, origin_offset_x, origin_offset_y):
        """
        Find position for purge tower
        :param x_max: print objects x max
        :param x_min: print objects x min
        :param y_max: print objects y max
        :param y_min: print objects y min
        :param machine_type: printer type; 0 = cartesian, 1 = delta
        :param stroke_x: bed width
        :param stroke_y: bed height
        :param origin_offset_x: origin x offset
        :param origin_offset_y: origin y offset
        :return:
        """

        self.x_mid = (x_max + x_min) / 2
        self.y_mid = (y_max + y_min) / 2

        if machine_type == TYPE_CARTESIAN:
            position = self._cartesian_position(x_max, x_min, y_max, y_min, stroke_x,
                            stroke_y, origin_offset_x, origin_offset_y)
        else:
            position = self._delta_position(x_max, x_min, y_max, y_min, stroke_x,
                            stroke_y, origin_offset_x, origin_offset_y)

        self.log.info("Tower start coordinate: X%.3f, Y%.3f, position %s" %(self.start_pos_x, self.start_pos_y, position))

        # get raft position
        x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -2, -1.2)
        self.raft_pos_x = x
        self.raft_pos_y = y

    def generate_purge_speeds(self, min_speed):
        """
        Initialize a list for purge speeds
        :param min_speed: minimum speed for last lines
        :return: list of print speeds
        """
        speed = min_speed
        min_speed_lines = 0
        purge_speeds = []
        for i in range(self.purge_lines):
            if i >= min_speed_lines:
                speed = 2400
            purge_speeds.insert(0, speed)
        return purge_speeds

    def get_pre_switch_gcode(self, extruder, flip):
        # TODO: read from file

        feed_rate = 4.5 / 50

        if self.hw_config == PEEK:
            if flip:
                y_1 = 0.6
                y_2 = 1.4
                y_3 = 0.6
                y_4 = 1.4
            else:
                y_1 = 1.4
                y_2 = 0.6
                y_3 = 1.4
                y_4 = 0.6
            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_1, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.W, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_2, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_3, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.W, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_4, 3000), b" Y shift"

            yield gcode.gen_extruder_move(-20, 1500), b" rapid retract"
            yield gcode.gen_extruder_move(-15, 1500), b" 25mm/s reshaping"
            yield b"G4 P2000", b" 2s cooling period"
            yield gcode.gen_extruder_move(-95, 1500), b" 25mm/s long retract"

        elif self.hw_config == PTFE:
            if flip:
                y_1 = 0.6
                y_2 = 1.4
                y_3 = 0.6
                y_4 = 1.4
            else:
                y_1 = 1.4
                y_2 = 0.6
                y_3 = 1.4
                y_4 = 0.6

            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_1, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.W, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_2, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_3, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.W, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_4, 3000), b" Y shift"

            yield gcode.gen_extruder_move(-20, 3000), b" rapid retract"
            yield b"G4 P2500", b" 2.5s cooling period"
            yield gcode.gen_extruder_move(-140, 3000), b" 50mm/s long retract"

        elif self.hw_config == PTFE4:
            if flip:
                y_1 = 0.6
                y_2 = 1.4
                y_3 = 0.6
                y_4 = 1.4
            else:
                y_1 = 1.4
                y_2 = 0.6
                y_3 = 1.4
                y_4 = 0.6

            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_1, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.W, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_2, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_3, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.W, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_4, 3000), b" Y shift"

            yield gcode.gen_extruder_move(-20, 3000), b" rapid retract"
            yield gcode.gen_extruder_move(-15, 1500), b" 25mm/s reshaping"
            yield b"G4 P2500", b" 2.5s cooling period"
            yield gcode.gen_extruder_move(-140, 3000), b" 50mm/s long retract"

        elif self.hw_config == E3DV6:
            if flip:
                y_1 = 0.8
                y_2 = 1.4
                y_3 = 0.6
                y_4 = 1.4
                y_5 = 1
            else:
                y_1 = 1.4
                y_2 = 0.6
                y_3 = 1.4
                y_4 = 0.6
                y_5 = 1.4

            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_1, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.W, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_2, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_3, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.W, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_4, 3000), b" Y shift"
            yield gcode.gen_direction_move(self.E, self.width, 6000, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.N, y_5, 3000), b" Y shift"

            yield gcode.gen_extruder_move(-20, 3000), b" rapid retract"
            yield b"G4 P2500", b" 2.5s cooling period"
            yield gcode.gen_extruder_move(-140, 3000), b" 50mm/s long retract"

    def get_post_switch_gcode(self, extruder):
        # TODO: read from file
        feed_rate = 5 / 50

        if self.hw_config == PEEK:
            yield b"G1 E10 F1500", b" 25mm/s feed"
            yield b"G1 E90 F3000", b" 50mm/s feed"
            yield b"G1 E25 F1500", b" 25mm/s feed"
            yield gcode.gen_direction_move(self.E, self.width, 900, extruder, feed_rate=feed_rate), b" prime trail"
            self.prepurge_sign = 1
        elif self.hw_config == PTFE:
            yield b"G1 E10 F1500", b" 25mm/s feed"
            yield b"G1 E90 F3000", b" 50mm/s feed"
            yield b"G1 E54 F1500", b" 25mm/s feed"
            yield gcode.gen_direction_move(self.E, self.width, 900, extruder, feed_rate=feed_rate), b" prime trail"
            self.prepurge_sign = 1
        elif self.hw_config == PTFE4:
            yield b"G1 E10 F1500", b" 25mm/s feed"
            yield b"G1 E105 F3000", b" 50mm/s feed"
            yield b"G1 E54 F1500", b" 25mm/s feed"
            yield gcode.gen_direction_move(self.E, self.width, 900, extruder, feed_rate=feed_rate), b" prime trail"
            self.prepurge_sign = 1
        elif self.hw_config == E3DV6:
            yield b"G1 E10 F1500", b" 25mm/s feed"
            yield b"G1 E90 F3000", b" 50mm/s feed"
            yield b"G1 E54 F1500", b" 25mm/s feed"
            yield gcode.gen_direction_move(self.W, self.width, 900, extruder, feed_rate=feed_rate), b" prime trail"
            self.prepurge_sign = -1

    def get_raft_lines(self, first_layer, extruder, retract, xy_speed, z_speed):
        """
        G-code lines for the raft
        :param first layer: first layer
        :param extruder: first extruder object
        :param retract: to retract or not
        :return: list of cmd, comment tuples
        """
        yield None, b" TOWER RAFT START"
        if extruder.z_hop:
            z_hop = self.raft_layer_height + extruder.z_hop
            yield ("G1 Z%.3f F%s" % (z_hop, z_speed)).encode(), b" z-hop"
        x, y = gcode.get_coordinates_by_offsets(self.E, self.raft_pos_x, self.raft_pos_y, -0.4, -0.4)
        yield gcode.gen_head_move(x, y, xy_speed), b" move to raft zone"
        yield ("G1 Z%.1f F%d" % (self.raft_layer_height, z_speed)).encode(), b" move z close"
        yield b"G91", b" relative positioning"

        # box
        width = self.raft_width + 0.8
        height = self.raft_height + 0.8
        speed = 2000
        yield gcode.gen_direction_move(self.E, width, speed, extruder), b" raft wall"
        yield gcode.gen_direction_move(self.N, height, speed, extruder), b" raft wall"
        yield gcode.gen_direction_move(self.W, width, speed, extruder), b" raft wall"
        width -= 0.4
        height -= 0.4
        yield gcode.gen_direction_move(self.S, height, speed, extruder), b" raft wall"
        yield gcode.gen_direction_move(self.E, width, speed, extruder), b" raft wall"
        height -= 0.4
        yield gcode.gen_direction_move(self.N, height, speed, extruder), b" raft wall"
        width -= 0.4
        height -= 0.4
        yield gcode.gen_direction_move(self.W, width, speed, extruder), b" raft wall"
        yield gcode.gen_direction_move(self.S, height, speed, extruder), b" raft wall"

        yield gcode.gen_direction_move(self.SE, 0.6, xy_speed), None

        feed_rate = extruder.get_feed_rate(multiplier=1.3)
        speed = 1000
        for _ in range(int(self.raft_width/2)):
            yield gcode.gen_direction_move(self.N, self.raft_height, speed, extruder, feed_rate), b" raft1"
            yield gcode.gen_direction_move(self.E, 1, speed), b" raft2"
            yield gcode.gen_direction_move(self.S, self.raft_height, speed, extruder, feed_rate), b" raft3"
            yield gcode.gen_direction_move(self.E, 1, speed), b" raft4"

        if retract:
            yield extruder.get_retract_gcode()
        yield b"G90", b" absolute positioning"
        yield b"M83", b" relative E"
        yield b"G92 E0", b" reset extruder position"
        yield None, b" TOWER RAFT END"

        # update slot z values
        for i in range(self.max_slots):
            self.slots[i]['last_z'] = self.raft_layer_height

    def _get_z_hop(self, layer, z_speed, extruder):
        """
        Get g-code for z-hop
        :param layer: current layer
        :param z_speed: z-axis speed
        :param extruder: current extruder
        :return: G-code for z-hop or None
        """
        max_z = 0
        for s in self.slots:
            if self.slots[s]['last_z'] > max_z:
                max_z = self.slots[s]['last_z']

        if layer.z > max_z:
            new_z_hop = layer.z
        else:
            new_z_hop = max_z
        if extruder.z_hop:
            new_z_hop += extruder.z_hop
        return ("G1 Z%.3f F%.1f" % (new_z_hop, z_speed)).encode(), b" z-hop"

    def _get_retraction(self, e_pos, extruder):
        """
        Get g-code for retraction. Calculate needed retraction length from current e position
        :param e_pos: extruder position
        :param extruder: extruder object
        :return: retraction g-code
        """
        retraction = extruder.retract + e_pos
        self.log.debug("Retraction to add: %s. E position: %s" %(retraction, e_pos))
        if not utils.is_float_zero(retraction, 3):
            if retraction > extruder.retract:
                retraction = extruder.retract
            return ("G1 E%.4f F%.1f" % (-retraction, extruder.retract_speed)).encode(), b" tower retract"

    def _get_wall_position_gcode(self, layer, flipflop, xy_speed):
        """
        Retun g-code line for positioning head for wall print
        :param layer: current layer
        :param flipflop: flip or flop
        :param xy_speed: xy travel speed
        :return: g-code line
        """
        y_pos = (self.wall_height + 0.4) * self.slot
        if not flipflop:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -1.2, self.wall_height - 0.5 + y_pos)
        else:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -1.2, -0.5 + y_pos)
        #print(self.start_pos_x, self.start_pos_y, x, y)
        return gcode.gen_head_move(x, y, xy_speed), b" move to purge zone"

    def _get_wall_gcode(self, flipflop, extruder, wall_speed, feed_rate):
        """
        Return g-code for printing the purge tower walls
        :param flipflop: flip or flop
        :param extruder: extruder object
        :return: list of g-code lines
        """
        last_y = self.wall_height - 0.3
        if flipflop:
            yield gcode.gen_direction_move(self.E, self.wall_width, wall_speed, extruder, feed_rate=feed_rate), b" wall"
            yield gcode.gen_direction_move(self.N, self.wall_height, wall_speed, extruder, feed_rate=feed_rate), b" wall"
            yield gcode.gen_direction_move(self.W, self.wall_width, wall_speed, extruder, feed_rate=feed_rate), b" wall"
            yield gcode.gen_direction_move(self.S, last_y, wall_speed, extruder, feed_rate=feed_rate, last_line=True), b" wall"
        else:
            yield gcode.gen_direction_move(self.E, self.wall_width, wall_speed, extruder, feed_rate=feed_rate), b" wall"
            yield gcode.gen_direction_move(self.S, self.wall_height, wall_speed, extruder, feed_rate=feed_rate), b" wall"
            yield gcode.gen_direction_move(self.W, self.wall_width, wall_speed, extruder, feed_rate=feed_rate), b" wall"
            yield gcode.gen_direction_move(self.N, last_y, wall_speed, extruder, feed_rate=feed_rate, last_line=True), b" wall"

    def get_slot(self, layer):
        """
        Get next viable slot, based on lowest z
        :param layer: current layer
        :return: none
        """

        slot = 0
        min_z = 1000000000000
        for s in range(layer.tower_slots):
            if self.slots[s]['last_z'] < min_z:
                slot = s
                min_z = self.slots[s]['last_z']
        self.slot = slot

    def get_tower_lines(self, layer, e_pos, old_e, new_e, z_hop, z_speed, xy_speed):
        """
        G-code for switch tower
        :param layer: current layer
        :param e_pos: extruder position
        :param old_e: old extruder
        :param new_e: new extruder
        :param z_hop: z_hop position
        :param z_speed: z axis speed
        :return: list of cmd, comment tuples
        """
        self.log.debug("Adding purge tower")
        yield None, b" TOWER START"

        self.get_slot(layer)

        # minimum speed
        min_speed, feed_rate = layer.get_outer_perimeter_rates()

        # handle retraction
        retraction = self._get_retraction(e_pos, old_e)
        if retraction:
            yield retraction

        # handle z-hop
        hop = self._get_z_hop(layer, z_speed, old_e)
        if hop:
            yield hop

        y_pos = (self.wall_height + 0.4) * self.slot
        if self.slots[self.slot]['flipflop_purge']:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -0.6, 0.2 + y_pos)
        else:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, 0.6, 0 + y_pos)
        yield gcode.gen_head_move(x, y, xy_speed), b" move to purge zone"

        tower_z = 0.2 + self.slots[self.slot]['last_z']
        self.slots[self.slot]['last_z'] = tower_z
        yield ("G1 Z%.3f F%.1f" % (tower_z, z_speed)).encode(), b" move z close"
        yield b"G91", b" relative positioning"
        yield old_e.get_prime_gcode(change=-0.1)

        # pre-switch purge
        for line in self.get_pre_switch_gcode(old_e, self.slots[self.slot]['flipflop_purge']):
            yield line

        yield ("T%s" % new_e.tool).encode(), b" change tool"

        # feed new filament
        for line in self.get_post_switch_gcode(new_e):
            yield line

        # post-switch purge
        purge_feed_rate = new_e.get_feed_rate(multiplier=1.2)
        # switch direction depending of prepurge orientation
        purge_length = self.purge_line_length

        if self.prepurge_sign == 1:
            dir_1 = self.W
            dir_2 = self.E
        else:
            dir_1 = self.E
            dir_2 = self.W

        for speed in self.generate_purge_speeds(min_speed):
            if self.slots[self.slot]['flipflop_purge']:
                yield gcode.gen_direction_move(self.N, 0.6, 3000), b" Y shift"
                yield gcode.gen_direction_move(dir_1, purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"
                yield gcode.gen_direction_move(self.N, 0.9, 3000), b" Y shift"
                yield gcode.gen_direction_move(dir_2, purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"
            else:
                yield gcode.gen_direction_move(self.N, 0.9, 3000), b" Y shift"
                yield gcode.gen_direction_move(dir_1, purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"
                yield gcode.gen_direction_move(self.N, 0.6, 3000), b" Y shift"
                yield gcode.gen_direction_move(dir_2, purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"

        if self.slots[self.slot]['flipflop_purge']:
            yield gcode.gen_direction_move(self.N, 0.6, 3000), b" Y shift"
        else:
            yield gcode.gen_direction_move(self.N, 0.9, 3000), b" Y shift"
        yield gcode.gen_direction_move(dir_1, purge_length, 2400, new_e, feed_rate=feed_rate), b" purge trail"

        if self.hw_config == E3DV6:
            # one more purge line for E3Dv6
            if self.slots[self.slot]['flipflop_purge']:
                yield gcode.gen_direction_move(self.N, 0.9, 3000), b" Y shift"
            else:
                yield gcode.gen_direction_move(self.N, 0.6, 3000), b" Y shift"
            yield gcode.gen_direction_move(dir_2, purge_length, min_speed, new_e, feed_rate=feed_rate), b" purge trail"

        # move to purge zone upper left corner
        yield b"G90", b" absolute positioning"
        yield self._get_wall_position_gcode(layer, False, xy_speed)
        yield b"G91", b" relative positioning"

        # wall gcode
        for line in self._get_wall_gcode(False, new_e, min_speed, feed_rate):
            yield line

        yield new_e.get_retract_gcode()
        if new_e.wipe:
            yield gcode.gen_direction_move(self.S, new_e.wipe, 3000), b" wipe"

        yield b"G90", b" absolute positioning"
        yield b"M83", b" relative E"
        yield b"G92 E0", b" reset extruder position"
        hop = self._get_z_hop(layer, z_speed, old_e)
        if hop:
            yield hop
        yield None, b" TOWER END"

        # flip the flop
        self.slots[self.slot]['flipflop_purge'] = not self.slots[self.slot]['flipflop_purge']

    def get_infill_lines(self, layer, e_pos, extruder, z_hop, z_speed, xy_speed):
        """
        G-code for switch tower infill
        :param layer: current layer
        :param e_pos: extruder position
        :param extruder: active extruder
        :param z_hop: z_hop position
        :param z_speed: z axis speed
        :return: list of cmd, comment tuples
        """

        self.get_slot(layer)

        # no need to add infll if tower is already higher than layer
        if layer.z <= self.slots[self.slot]['last_z']:
            return []

        self.log.debug("Adding purge tower infill")
        yield None, b" TOWER INFILL START"

        # minimum speed
        min_speed, feed_rate = layer.get_outer_perimeter_rates()

        # handle retraction
        retraction = self._get_retraction(e_pos, extruder)
        if retraction:
            yield retraction

        # handle z-hop
        hop = self._get_z_hop(layer, z_speed, extruder)
        if hop:
            yield hop

        tower_z = 0.2 + self.slots[self.slot]['last_z']
        self.slots[self.slot]['last_z'] = tower_z

        yield self._get_wall_position_gcode(layer, self.slots[self.slot]['flipflop_infill'], xy_speed)
        yield ("G1 Z%.3f F%.1f" % (tower_z, z_speed)).encode(), b" move z close"
        yield b"G91", b" relative positioning"
        yield extruder.get_prime_gcode()

        # infill
        infill_x = self.wall_width/6
        infill_y = self.wall_height-0.3
        infill_angle = math.degrees(math.atan(infill_y/infill_x))
        infill_path_length = gcode.calculate_path_length((0,0), (infill_x, infill_y))

        # wall gcode
        for line in self._get_wall_gcode(self.slots[self.slot]['flipflop_infill'], extruder, 2400, feed_rate):
            yield line

        flip = self.slots[self.slot]['flipflop_infill']

        step = (2400-min_speed)/4
        speeds = [2400 - i * step for i in range(4)]
        speeds.extend([min_speed, min_speed])

        direction = infill_angle
        round = len(speeds)
        for speed in speeds:
            round -= 1
            if flip:
                direction = self.E + infill_angle
            else:
                direction = self.E + 360-infill_angle
            yield gcode.gen_direction_move(direction, infill_path_length, speed, extruder, feed_rate=feed_rate,
                                           last_line=round == 0), b" infill"
            flip = not flip

        yield extruder.get_retract_gcode()
        if extruder.wipe:
            yield gcode.gen_direction_move(direction + 180, extruder.wipe, 2000), b" wipe"

        yield b"G90", b" absolute positioning"
        yield b"M83", b" relative E"
        hop = self._get_z_hop(layer, z_speed, extruder)
        if hop:
            yield hop
        yield b"G92 E0", b" reset extruder position"
        yield None, b" TOWER INFILL END"

        # flip the flop
        self.slots[self.slot]['flipflop_infill'] = not self.slots[self.slot]['flipflop_infill']

    def check_infill(self, layer, e_pos, extruder, z_hop, z_speed, xy_speed):
        """
        Checks if tower z is too low versus layer and adds infill if needed
        :param layer: current layer
        :param e_pos: extruder position
        :param extruder: active extruder
        :param z_hop: z_hop position
        :param z_speed: z axis speed
        :return: list of cmd, comment tuples
        """
        # TODO: rethink whole line thing. Maybe Writer object?

        while True:
            count = 0
            for s in range(layer.tower_slots):
                if self.slots[s]['last_z'] < layer.z - 0.2:
                    for l in self.get_infill_lines(layer, e_pos, extruder, z_hop, z_speed, xy_speed):
                        yield l
                    count += 1
            if not count:
                break



if __name__ == "__main__":
    from logger import Logger
    log = Logger(".")
    st = SwitchTower(0, 1, log, PEEK)
    print(st.generate_purge_speeds(600))