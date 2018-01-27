import math

from gcode import GCode, E, S, W, N, NE, NW, SE, SW, TYPE_CARTESIAN, TYPE_DELTA
from settings import Settings

import utils

gcode = GCode()

AUTO = "Automatic"
LEFT = "Left"
RIGHT = "Right"
TOP = "Top"
BOTTOM = "Bottom"
TOWER_POSITIONS = [AUTO, LEFT, RIGHT, TOP, BOTTOM]

LINES = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]


class SwitchTower:

    def __init__(self, logger, settings: Settings, max_slots):
        """
        Filament switch tower functionality
        :param logger: Logger object
        :param settings: settings object
        :param max_slots: maximum number of tower slots
        """

        # localize
        self.E = E
        self.S = S
        self.W = W
        self.N = N
        self.NE = NE
        self.NW = NW
        self.SW = SW
        self.SE = SE

        self.settings = settings
        self.log = logger
        self.max_slots = max_slots

        self.slot = 0
        self.slots = {}

        self.width = self.settings.get_hw_config_float_value("prepurge.sweep.length")
        pre_purge_lines = self.settings.get_hw_config_float_value("prepurge.sweep.count")

        self.pre_purge_height = pre_purge_lines * self.settings.get_hw_config_float_value("prepurge.sweep.gap")

        # post purge line config
        self.purge_line_length = self.width - 1

        self.purge_line_width = 0.6

        self.height = self.pre_purge_height + self.settings.purge_lines * self.purge_line_width * 2 + 0.2

        self.wall_width = self.width + 1.4
        self.wall_height = self.height + 1.0

        self.raft_done = False
        self.raft_width = self.width + 4.0
        self.raft_height = self.wall_height * self.max_slots + 1.5
        self.raft_layer_height = 0.2
        self.angle = 0

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

        self.temperatures = {}
        self.warnings_shown = False

        self.e_pos = 0

        # infill speeds
        self.infill_speeds = [self.settings.default_speed,
                              self.settings.default_speed,
                              self.settings.default_speed,
                              self.settings.outer_perimeter_speed,
                              self.settings.outer_perimeter_speed,
                              self.settings.outer_perimeter_speed]

    def initialize_slots(self):
        """
        Initialize tower slot data
        :return:
        """
        for i in range(self.max_slots):
            self.slots[i] = {}
            self.slots[i]['last_z'] = self.settings.z_offset
            self.slots[i]['horizontal_dir'] = self.E
            self.slots[i]['vertical_dir'] = self.N
            self.slots[i]['flipflop_infill'] = False

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

    def _cartesian_position(self, x_max, x_min, y_max, y_min):
        """
        Find position for purge tower using cartesian limits
        :param x_max: print objects x max
        :param x_min: print objects x min
        :param y_max: print objects y max
        :param y_min: print objects y min
        :return:
        """
        # expect origin offset to be positive always
        bed_x_max = self.settings.stroke_x - self.settings.origin_offset_x
        bed_y_max = self.settings.stroke_y - self.settings.origin_offset_y

        bed_x_min = -self.settings.origin_offset_x
        bed_y_min = -self.settings.origin_offset_y

        # find a place that can accommodate the tower height
        if self.settings.tower_position == AUTO:
            positions = [TOP, RIGHT, BOTTOM, LEFT]
        else:
            positions = [self.settings.tower_position]

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

        if self.settings.tower_position == AUTO:
            raise ValueError("Not enough space for the tower inside the bed!")
        raise ValueError("Not enough room for tower using selected position %s" % self.settings.tower_position)

    def _delta_position(self, x_max, x_min, y_max, y_min):
        """
        Find position for purge tower using delta limits
        :param x_max: print objects x max
        :param x_min: print objects x min
        :param y_max: print objects y max
        :param y_min: print objects y min
        :return:
        """

        # assume that bed is round and origin is at the center
        bed_r = self.settings.stroke_x/2

        def check_coordinate(x, y):
            angle = math.atan(y / x)
            length = y / math.sin(angle)
            return abs(length) < bed_r

        # find a place that can accommodate the tower height
        if self.settings.tower_position == AUTO:
            positions = [TOP, RIGHT, BOTTOM, LEFT]
        else:
            positions = [self.settings.tower_position]

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

        if self.settings.tower_position == AUTO:
            raise ValueError("Not enough space for the tower inside the bed!")
        raise ValueError("Not enough room for tower using selected position %s" % self.settings.tower_position)

    def find_tower_position(self, x_max, x_min, y_max, y_min):
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

        #print("maxes", x_max, y_max)
        #print("mids", self.x_mid, self.y_mid)

        if self.settings.machine_type == TYPE_CARTESIAN:
            position = self._cartesian_position(x_max, x_min, y_max, y_min)
        else:
            position = self._delta_position(x_max, x_min, y_max, y_min)

        self.log.info("Tower start coordinate: X%.3f, Y%.3f, position %s" %(self.start_pos_x, self.start_pos_y, position))

        # get raft position
        x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -2, -1.2)
        self.raft_pos_x = x
        self.raft_pos_y = y

        # init slots after tower rotation is done
        self.initialize_slots()

    def generate_purge_speeds(self, min_speed):
        """
        Initialize a list for purge speeds
        :param min_speed: minimum speed for last lines
        :return: list of print speeds
        """
        max_speed = 3600
        speed = min_speed
        min_speed_lines = 2
        purge_speeds = []
        for i in range(self.settings.purge_lines):
            if i >= min_speed_lines:
                speed = max_speed
            purge_speeds.append(speed)
        return purge_speeds

    def get_pre_switch_gcode(self, extruder, new_temp, tool):
        """
        Generates pre tool switch g-code
        :param extruder: active extruder
        :param flip: flip
        :param new_temp: new temperature value
        :param tool:
        :return:
        """
        feed_rate = self.settings.get_hw_config_float_value("prepurge.sweep.extrusion.length") / self.width

        sweep_speed = self.settings.get_hw_config_float_value("prepurge.sweep.speed")
        sweep_gap = self.settings.get_hw_config_float_value("prepurge.sweep.gap")
        sweep_gap_speed = self.settings.get_hw_config_float_value("prepurge.sweep.gap.speed")

        horizontal_dir = self.slots[self.slot]['horizontal_dir']
        vertical_dir = self.slots[self.slot]['vertical_dir']

        for _ in range(self.settings.get_hw_config_int_value("prepurge.sweep.count")):
            yield gcode.gen_direction_move(horizontal_dir, self.width, sweep_speed, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(vertical_dir, sweep_gap, sweep_gap_speed), b" Y shift"
            horizontal_dir = gcode.opposite_dir(horizontal_dir)

        if new_temp:
            yield (gcode.gen_temperature_nowait_tool(new_temp, tool), b" change nozzle temp")

        i = 0
        while True:
            try:
                rr_len = self.settings.get_hw_config_float_value("rapid.retract.initial[{}].length".format(i))
                rr_speed = self.settings.get_hw_config_float_value("rapid.retract.initial[{}].speed".format(i))
                yield gcode.gen_extruder_move(-rr_len, rr_speed), b" rapid retract"
                i += 1
            except TypeError:
                if i == 0 and not self.warnings_shown:
                    self.log.warning("No rapid.retract.initial[N].length or .speed found. Please check the HW-config")
                break

        pause = self.settings.get_hw_config_float_value("rapid.retract.pause")
        if pause:
            yield gcode.gen_pause(pause), b" cooling period"

        i = 0
        while True:
            try:
                rr_long_len = self.settings.get_hw_config_float_value("rapid.retract.long[{}].length".format(i))
                rr_long_speed = self.settings.get_hw_config_float_value("rapid.retract.long[{}].speed".format(i))
                yield gcode.gen_extruder_move(-rr_long_len, rr_long_speed), b" long retract"
                i += 1
            except TypeError:
                if i == 0 and not self.warnings_shown:
                    self.log.warning("No rapid.retract.long[N].length or .speed found. Please check the HW-config")
                break
                
        # Cooling movements, as seen in Slic3r gcode, need to override length values from extruder, modified in gcode.py
        i = 0
        while True:
            try:
                rr_cool_len = self.settings.get_hw_config_float_value("rapid.retract.cool[{}].length".format(i))
                rr_cool_speed = self.settings.get_hw_config_float_value("rapid.retract.cool[{}].speed".format(i))
                yield gcode.gen_direction_move(horizontal_dir, self.width, rr_cool_speed, extruder, e_length=rr_cool_len), b" cooling"
                horizontal_dir = gcode.opposite_dir(horizontal_dir)
                i += 1
            except TypeError:
                if i == 0 and not self.warnings_shown:
                    self.log.warning("No cooling steps. That's OK.")
                break

        self.slots[self.slot]['horizontal_dir'] = horizontal_dir
                
    def get_post_switch_gcode(self, extruder, new_temp):
        # should we move head while feeding?
        feedtrail = self.settings.get_hw_config_value("feed.trail")
        # feed new filament
        values = []
        i = 0

        if feedtrail == "True":
            horizontal_dir = self.slots[self.slot]['horizontal_dir']
            while True:
                try:
                    feed_len = self.settings.get_hw_config_float_value("feed[{}].length".format(i))
                    feed_speed = self.settings.get_hw_config_float_value("feed[{}].speed".format(i))
                    yield gcode.gen_direction_move(horizontal_dir, self.width, feed_speed, extruder, e_length=feed_len), b" prime move"
                    horizontal_dir = gcode.opposite_dir(horizontal_dir)
                    i += 1
                except TypeError:
                    if i == 0 and not self.warnings_shown:
                        self.log.warning("No prime move steps. That's OK.")
                    break

            self.slots[self.slot]['horizontal_dir'] = horizontal_dir
        else:
            while True:
                try:
                    feed_len = self.settings.get_hw_config_float_value("feed[{}].length".format(i))
                    feed_speed = self.settings.get_hw_config_float_value("feed[{}].speed".format(i))
                    values.append((feed_len, feed_speed))
                    i += 1
                except TypeError:
                    if i == 0 and not self.warnings_shown:
                        self.log.warning("No feed[N].length or .speed found. Please check the HW-config")
                    break

            # temperature change handling
            if new_temp:
                last_val = values[-1]
                values[-1] = (last_val[0] - 5, last_val[1])
                for feed_len, feed_speed in values:
                    yield gcode.gen_extruder_move(feed_len, feed_speed), b" feed"
                # stop 5mm before feed end to wait proper temp
                yield (gcode.gen_temperature_wait_tool(new_temp, extruder.temperature_nr), b" change nozzle temp, wait")
                yield gcode.gen_extruder_move(5, last_val[1]), b" 25mm/s feed"
            else:
                for feed_len, feed_speed in values:
                    yield gcode.gen_extruder_move(feed_len, feed_speed), b" feed"
        
        # prime trail
        prime_feed_rate = self.settings.get_hw_config_float_value("prime.trail.extrusion.length") / self.width
        prime_trail_speed = self.settings.get_hw_config_float_value("prime.trail.speed")
        yield gcode.gen_direction_move(self.slots[self.slot]['horizontal_dir'],
                                       self.width,
                                       prime_trail_speed,
                                       extruder,
                                       feed_rate=prime_feed_rate), b" prime trail"

        self.slots[self.slot]['horizontal_dir'] = gcode.opposite_dir(self.slots[self.slot]['horizontal_dir'])

        # no need to show the warnings again
        self.warnings_shown = True

    def get_raft_lines(self, first_layer, extruder):
        """
        G-code lines for the raft
        :param first layer: first layer
        :param extruder: first extruder object
        :return: list of cmd, comment tuples
        """
        yield None, b" TOWER RAFT START"

        self.raft_layer_height = first_layer.height
        feed_multi = (self.raft_layer_height / 0.2) * (self.settings.raft_multi/100)

        if extruder.z_hop:
            z_hop = self.raft_layer_height + extruder.z_hop + self.settings.z_offset
            yield gcode.gen_z_move(z_hop, self.settings.travel_z_speed), b" z-hop"
        else:
            yield gcode.gen_z_move(self.raft_layer_height + self.settings.z_offset + 5, self.settings.travel_z_speed), b" move z close"

        x, y = gcode.get_coordinates_by_offsets(self.E, self.raft_pos_x, self.raft_pos_y, -0.4, -0.4)
        yield gcode.gen_head_move(x, y, self.settings.travel_xy_speed), b" move to raft zone"
        yield gcode.gen_z_move(self.raft_layer_height + self.settings.z_offset, self.settings.travel_z_speed), b" move z close"

        prime = self._get_prime(extruder)
        if prime:
            yield prime

        yield gcode.gen_relative_positioning(), b" relative positioning"

        feed_rate = extruder.get_feed_rate(multiplier=feed_multi)

        # box
        width = self.raft_width + 0.8
        height = self.raft_height + 0.8
        speed = self.settings.first_layer_speed
        yield gcode.gen_direction_move(self.E, width, speed, extruder, feed_rate=feed_rate), b" raft wall"
        yield gcode.gen_direction_move(self.N, height, speed, extruder, feed_rate=feed_rate), b" raft wall"
        yield gcode.gen_direction_move(self.W, width, speed, extruder, feed_rate=feed_rate), b" raft wall"
        width -= 0.4
        height -= 0.4
        yield gcode.gen_direction_move(self.S, height, speed, extruder, feed_rate=feed_rate), b" raft wall"
        yield gcode.gen_direction_move(self.E, width, speed, extruder, feed_rate=feed_rate), b" raft wall"
        height -= 0.4
        yield gcode.gen_direction_move(self.N, height, speed, extruder, feed_rate=feed_rate), b" raft wall"
        width -= 0.4
        height -= 0.4
        yield gcode.gen_direction_move(self.W, width, speed, extruder, feed_rate=feed_rate), b" raft wall"
        yield gcode.gen_direction_move(self.S, height, speed, extruder, feed_rate=feed_rate), b" raft wall"

        yield gcode.gen_direction_move(self.SE, 0.6, self.settings.travel_xy_speed), None

        feed_rate = extruder.get_feed_rate(multiplier=1.3 * feed_multi)
        speed = self.settings.first_layer_speed
        for _ in range(int(self.raft_width/2)):
            yield gcode.gen_direction_move(self.N, self.raft_height, speed, extruder, feed_rate=feed_rate), b" raft1"
            yield gcode.gen_direction_move(self.E, 1, speed), b" raft2"
            yield gcode.gen_direction_move(self.S, self.raft_height, speed, extruder, feed_rate=feed_rate), b" raft3"
            yield gcode.gen_direction_move(self.E, 1, speed), b" raft4"

        yield extruder.get_retract_gcode()
        self.e_pos = -extruder.retract

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        yield None, b" TOWER RAFT END"

        # update slot z values
        for i in range(self.max_slots):
            self.slots[i]['last_z'] = self.slots[i]['last_z'] + self.raft_layer_height

    def _get_z_hop(self, layer, extruder):
        """
        Get g-code for z-hop
        :param layer: current layer
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
        return gcode.gen_z_move(new_z_hop, self.settings.travel_z_speed), b" z-hop"

    def _get_retraction(self, extruder):
        """
        Get g-code for retraction. Calculate needed retraction length from current e position
        :param extruder: extruder object
        :return: retraction g-code
        """
        if not extruder.retract:
            return

        retraction = extruder.get_retract_gcode(self.e_pos, comment=b" tower retract")
        if retraction:
            self.e_pos = -extruder.retract
            return retraction

    def _get_prime(self, extruder):
        """
        Get g-code for prime. Calculate needed prime length from current e position
        :param extruder: extruder object
        :return: prime g-code
        """
        if not extruder.retract:
            return

        if self.e_pos < 0 and not utils.is_float_zero(self.e_pos, 3):
            prime = extruder.retract + self.e_pos
            self.e_pos = 0
            return extruder.get_prime_gcode(change=prime, comment=b" tower prime")

    def _get_wall_position_gcode(self, x_direction, y_direction):
        """
        Retun g-code line for positioning head for wall print
        :param x_direction: current x direction
        :param y_direction: current y direction
        :return: g-code line
        """
        y_pos = (self.wall_height + 0.4) * self.slot
        if x_direction == self.E:
            x_offset = -1.2
        else:
            x_offset = self.wall_width - 1.2

        if y_direction == self.N:
            y_offset = self.wall_height - 0.5 + y_pos
        else:
            y_offset = -0.5 + y_pos

        x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, x_offset, y_offset)
        self.log.debug(self.start_pos_x, self.start_pos_y, x, y)
        return gcode.gen_head_move(x, y, self.settings.travel_xy_speed), b" move to purge zone"

    def _get_wall_gcode(self, extruder, feed_rate, last_speed, x_direction, y_direction):
        """
        Return g-code for printing the purge tower walls
        :param flipflop: flip or flop
        :param extruder: extruder object
        :param last_speed: speed for the last line
        :param x_direction: current x direction
        :param y_direction: current y direction
        :return: list of g-code lines
        """
        last_y = self.wall_height - 0.3
        wall_speed = self.settings.default_speed

        x_dir = x_direction
        y_dir = gcode.opposite_dir(y_direction)

        yield gcode.gen_direction_move(x_dir, self.wall_width, wall_speed, extruder, feed_rate=feed_rate), b" wall"
        yield gcode.gen_direction_move(y_dir, self.wall_height, wall_speed, extruder, feed_rate=feed_rate), b" wall"

        x_dir = gcode.opposite_dir(x_dir)
        y_dir = gcode.opposite_dir(y_dir)

        yield gcode.gen_direction_move(x_dir, self.wall_width, last_speed, extruder, feed_rate=feed_rate), b" wall"
        yield gcode.gen_direction_move(y_dir, last_y, last_speed, extruder, feed_rate=feed_rate, last_line=True), b" wall"

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

    def get_tower_lines(self, layer, e_pos, old_e, new_e, z_hop):
        """
        G-code for switch tower
        :param layer: current layer
        :param e_pos: extruder position
        :param old_e: old extruder
        :param new_e: new extruder
        :param z_hop: z_hop position
        :return: list of cmd, comment tuples
        """

        # TODO: move this to global state
        self.e_pos = e_pos

        # add raft if not added
        if not self.raft_done:
            for line in self.get_raft_lines(layer, old_e):
                yield line
            self.raft_done = True

        self.log.debug("Adding purge tower")
        yield None, b" TOWER START"

        self.get_slot(layer)

        initial_horizontal_dir = self.slots[self.slot]['horizontal_dir']

        # minimum speed
        min_speed, feed_rate = layer.get_outer_perimeter_rates()

        # handle retraction
        retraction = self._get_retraction(old_e)
        if retraction:
            yield retraction

        # handle z-hop
        hop = self._get_z_hop(layer, old_e)
        if hop:
            yield hop

        y_pos = (self.wall_height + 0.4) * self.slot
        if self.slots[self.slot]['horizontal_dir'] == self.E:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -0.5, 0.2 + y_pos)
        else:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x,
                                                    self.start_pos_y, self.width-0.5, -0.2 + y_pos + self.height)
        yield gcode.gen_head_move(x, y, self.settings.travel_xy_speed), b" move to purge zone"

        tower_z = 0.2 + self.slots[self.slot]['last_z']
        self.slots[self.slot]['last_z'] = tower_z
        yield gcode.gen_z_move(tower_z, self.settings.travel_z_speed), b" move z close"
        yield gcode.gen_relative_positioning(), b" relative positioning"

        prime = self._get_prime(old_e)
        if prime:
            yield prime

        new_temp = new_e.get_temperature(layer.num)
        old_temp = self.temperatures.get(old_e.tool, old_e.get_temperature(layer.num))
        self.temperatures[new_e.tool] = new_temp
        if new_temp == old_temp:
            new_temp = None

        # pre-switch purge
        for line in self.get_pre_switch_gcode(old_e, new_temp, old_e.temperature_nr):
            yield line

        yield gcode.gen_tool_change(new_e.tool), b" change tool"

        # feed new filament
        if new_temp and abs(new_temp - old_temp) > 15:
            for line in self.get_post_switch_gcode(new_e, new_temp):
                yield line
        else:
            for line in self.get_post_switch_gcode(new_e, None):
                yield line

        # post-switch purge
        purge_feed_rate = new_e.get_feed_rate(multiplier=1.2)
        # switch direction depending of prepurge orientation
        purge_length = self.purge_line_length

        gap_speed = self.settings.get_hw_config_float_value("prepurge.sweep.gap.speed")

        first_line = True
        for speed in self.generate_purge_speeds(min_speed):
            for _ in range(2):
                yield gcode.gen_direction_move(self.slots[self.slot]['vertical_dir'],
                                               self.purge_line_width, gap_speed), b" Y shift"
                if first_line:
                    yield gcode.gen_direction_move(self.slots[self.slot]['horizontal_dir'], 0.5,
                                                   self.settings.travel_xy_speed), b" shift"
                    first_line = False
                yield gcode.gen_direction_move(self.slots[self.slot]['horizontal_dir'],
                                               purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"
                self.slots[self.slot]['horizontal_dir'] = gcode.opposite_dir(self.slots[self.slot]['horizontal_dir'])

        # move to purge zone wall start position
        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield self._get_wall_position_gcode(self.slots[self.slot]['horizontal_dir'],
                                            self.slots[self.slot]['vertical_dir'])
        yield gcode.gen_relative_positioning(), b" relative positioning"

        # wall gcode
        for line in self._get_wall_gcode(new_e, feed_rate, self.settings.outer_perimeter_speed,
                                         self.slots[self.slot]['horizontal_dir'],
                                         self.slots[self.slot]['vertical_dir']):
            yield line

        yield new_e.get_retract_gcode()
        if new_e.wipe:
            wipe_dir = gcode.opposite_dir(self.slots[self.slot]['vertical_dir'])
            yield gcode.gen_direction_move(wipe_dir, new_e.wipe, gap_speed), b" wipe"

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        hop = self._get_z_hop(layer, old_e)
        if hop:
            yield hop
        yield None, b" TOWER END"

        # flip the directions
        self.slots[self.slot]['horizontal_dir'] = gcode.opposite_dir(initial_horizontal_dir)
        self.slots[self.slot]['vertical_dir'] = gcode.opposite_dir(self.slots[self.slot]['vertical_dir'])

    def get_infill_lines(self, layer, e_pos, extruder, z_hop):
        """
        G-code for switch tower infill
        :param layer: current layer
        :param e_pos: extruder position
        :param extruder: active extruder
        :param z_hop: z_hop position
        :return: list of cmd, comment tuples
        """

        # TODO: move this to global state
        self.e_pos = e_pos

        # add raft if not added
        if not self.raft_done:
            for line in self.get_raft_lines(layer, extruder):
                yield line
            self.raft_done = True

        self.get_slot(layer)

        # no need to add infll if tower is already higher than layer
        if layer.z <= self.slots[self.slot]['last_z']:
            return []

        self.log.debug("Adding purge tower infill")
        yield None, b" TOWER INFILL START"

        # minimum speed
        min_speed, feed_rate = layer.get_outer_perimeter_rates()

        # handle retraction
        retraction = self._get_retraction(extruder)
        if retraction:
            yield retraction

        # handle z-hop
        hop = self._get_z_hop(layer, extruder)
        if hop:
            yield hop

        tower_z = 0.2 + self.slots[self.slot]['last_z']
        self.slots[self.slot]['last_z'] = tower_z

        # infill
        infill_x = self.wall_width/6
        infill_y = self.wall_height-0.3
        infill_angle = math.degrees(math.atan(infill_y/infill_x))
        infill_path_length = gcode.calculate_path_length((0,0), (infill_x, infill_y))

        flip = self.slots[self.slot]['flipflop_infill']
        if flip:
            horizontal_dir = self.E
            vertical_dir = self.S

        else:
            horizontal_dir = self.W
            vertical_dir = self.N
            infill_angle = -infill_angle

        yield self._get_wall_position_gcode(horizontal_dir, vertical_dir)
        yield gcode.gen_z_move(tower_z, self.settings.travel_z_speed), b" move z close"
        yield gcode.gen_relative_positioning(), b" relative positioning"

        prime = self._get_prime(extruder)
        if prime:
            yield prime

        # wall gcode
        for line in self._get_wall_gcode(extruder, feed_rate, self.settings.default_speed,
                                         horizontal_dir, vertical_dir):
            yield line

        direction = infill_angle

        rounds = len(self.infill_speeds)
        for speed in self.infill_speeds:
            rounds -= 1
            if flip:
                direction = horizontal_dir + infill_angle
            else:
                direction = horizontal_dir + 360-infill_angle
            yield gcode.gen_direction_move(direction, infill_path_length, speed,
                                           extruder, feed_rate=feed_rate, last_line=rounds == 0), b" infill"

            flip = not flip

        yield extruder.get_retract_gcode()
        if extruder.wipe:
            yield gcode.gen_direction_move(direction + 180, extruder.wipe, 2000), b" wipe"

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        hop = self._get_z_hop(layer, extruder)
        if hop:
            yield hop
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        yield None, b" TOWER INFILL END"

        # flip the flop
        self.slots[self.slot]['flipflop_infill'] = not self.slots[self.slot]['flipflop_infill']

    def check_infill(self, layer, e_pos, extruder, z_hop):
        """
        Checks if tower z is too low versus layer and adds infill if needed
        :param layer: current layer
        :param e_pos: extruder position
        :param extruder: active extruder
        :param z_hop: z_hop position
        :return: list of cmd, comment tuples
        """
        # TODO: rethink whole line thing. Maybe Writer object?

        while True:
            count = 0
            for s in range(layer.tower_slots):
                if self.slots[s]['last_z'] < layer.z - 0.2:
                    for l in self.get_infill_lines(layer, e_pos, extruder, z_hop):
                        yield l
                    count += 1
            if not count:
                break


if __name__ == "__main__":
    from logger import Logger
    log = Logger(".")
    settings = Settings()
    print(settings.get_hw_config_names())
    settings.hw_config = 'PTFE-PRO-12'
    st = SwitchTower(log, settings, 3)
    print(st.generate_purge_speeds(600))
