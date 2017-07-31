import math

from gcode import GCode, E, S, W, N, NE, NW, SE, SW

import utils

gcode = GCode()

# hw configs
PEEK = "PEEK-PRO-12"
PTFE = "PTFE-PRO-12"
E3DV6 = "PTFE-EV6"

HW_CONFIGS = [PTFE, E3DV6, PEEK]

AUTO = "Automatic"
LEFT = "Left"
RIGHT = "Right"
TOP = "Top"
BOTTOM = "Bottom"

TOWER_POSITIONS = [AUTO, LEFT, RIGHT, TOP, BOTTOM]


class SwitchTower:

    def __init__(self, logger, hw_config, tower_position):
        """
        Filament switc tower functionality
        :param logger: Logger object
        :param config: system configuration (PEEK, PTFE, E3Dv6)
        """

        self.log = logger

        self.width = 50
        self.height = 14 # use even values

        self.hw_config = hw_config
        if self.hw_config == E3DV6:
            self.height += 2

        self.tower_position = tower_position

        self.wall_width = self.width + 2.4
        self.wall_height = self.height + 1

        self.raft_width = self.width + 4
        self.raft_height = self.height + 2
        self.angle = 0
        self.last_tower_z = 0

        self.flipflop_purge = False
        self.flipflop_infill = False

        # post purge line config
        self.purge_line_length = self.width + 0.6
        self.purge_lines = int(abs(self.height / 2)) -1
        if self.hw_config == E3DV6:
            self.purge_lines -= 1

        # is prepurge position positive or negative
        self.prepurge_sign = 1

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

    def find_tower_position(self, x_max, x_min, y_max, y_min):
        """
        Find position for purge tower
        :param x_max: print objects x max
        :param x_min: print objects x min
        :param y_max: print objects y max
        :param y_min: print objects y min
        :return:
        """

        x_mid = (x_max + x_min) / 2
        y_mid = (y_max + y_min) / 2

        offset = 5

        if self.tower_position == AUTO:
            # TODO: detection detection...
            # TODO: check against bed dimensions
            position = TOP
        else:
            position = self.tower_position

        if position == LEFT:
            self.start_pos_x = x_min - offset
            self.start_pos_y = y_mid - self.width/2
            self.rotate_tower(90)
        elif position == RIGHT:
            self.start_pos_x = x_max + offset
            self.start_pos_y = y_mid + self.width/2
            self.rotate_tower(270)
        elif position == TOP:
            self.start_pos_x = x_mid - self.width/2
            self.start_pos_y = y_max + offset
            self.rotate_tower(0)
        elif position == BOTTOM:
            self.start_pos_x = x_mid + self.width/2
            self.start_pos_y = y_min - offset
            self.rotate_tower(180)

        # TODO: add sanity checks
        self.log.info("Tower lower left coordinate: X%.3f, Y%.3f (autodetect)" %(self.start_pos_x, self.start_pos_y))

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
            yield b"G1 E100 F3000", b" 50mm/s feed"
            yield b"G1 E25 F1500", b" 25mm/s feed"
            yield gcode.gen_direction_move(self.E, self.width, 900, extruder, feed_rate=feed_rate), b" prime trail"
            self.prepurge_sign = 1
        elif self.hw_config == PTFE:
            yield b"G1 E100 F3000", b" 50mm/s feed"
            yield b"G1 E54 F1500", b" 25mm/s feed"
            yield gcode.gen_direction_move(self.E, self.width, 900, extruder, feed_rate=feed_rate), b" prime trail"
            self.prepurge_sign = 1
        elif self.hw_config == E3DV6:
            yield b"G1 E100 F3000", b" 50mm/s feed"
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
            z_hop = 0.2 + extruder.z_hop
            yield ("G1 Z%.3f F%s" % (z_hop, z_speed)).encode(), b" z-hop"
        x, y = gcode.get_coordinates_by_offsets(self.E, self.raft_pos_x, self.raft_pos_y, -0.4, -0.4)
        yield gcode.gen_head_move(x, y, xy_speed), b" move to raft zone"
        yield ("G1 Z0.2 F%d" % z_speed).encode(), b" move z close"
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
        yield None, b" TOWER RAFT END"
        self.last_tower_z = 0.2

    def _get_z_hop(self, layer, z_hop, z_speed, extruder):
        """
        Get g-code for z-hop
        :param layer: current layer
        :param z-hop position
        :param z_speed: z-axis speed
        :param extruder: current extruder
        :return: G-code for z-hop or None
        """
        if extruder.z_hop:
            new_z_hop = self.last_tower_z + extruder.z_hop
            if new_z_hop != layer.z + z_hop:
                return ("G1 Z%.3f F%.1f" % (new_z_hop, z_speed)).encode(), b" z-hop"
        return None

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

    def _get_wall_position_gcode(self, flipflop, xy_speed):
        """
        Retun g-code line for positioning head for wall print
        :param flipflop: flip or flop
        :param xy_speed: xy travel speed
        :return: g-code line
        """
        if not flipflop:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -1.2, self.wall_height - 0.5)
        else:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -1.2, -0.5)
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

        # minimum speed
        min_speed, feed_rate = layer.get_outer_perimeter_rates()

        # handle retraction
        retraction = self._get_retraction(e_pos, old_e)
        if retraction:
            yield retraction

        # handle z-hop
        hop = self._get_z_hop(layer, z_hop, z_speed, old_e)
        if hop:
            yield hop

        self.last_tower_z = self.last_tower_z + layer.height
        if self.flipflop_purge:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, -0.6, 0.2)
        else:
            x, y = gcode.get_coordinates_by_offsets(self.E, self.start_pos_x, self.start_pos_y, 0.6, 0)
        yield gcode.gen_head_move(x, y, xy_speed), b" move to purge zone"

        yield ("G1 Z%.3f F%.1f" % (self.last_tower_z, z_speed)).encode(), b" move z close"
        yield b"G91", b" relative positioning"
        yield old_e.get_prime_gcode(change=-0.1)

        # pre-switch purge
        for line in self.get_pre_switch_gcode(old_e, self.flipflop_purge):
            yield line

        yield ("T%s" % new_e.tool).encode(), b" change tool"

        # feed new filament
        for line in self.get_post_switch_gcode(new_e):
            yield line

        # post-switch purge
        purge_feed_rate = new_e.get_feed_rate(multiplier=1.2)
        # switch direction depending of prepurge orientation
        purge_length = self.purge_line_length * self.prepurge_sign

        if self.prepurge_sign == 1:
            dir_1 = self.W
            dir_2 = self.E
        else:
            dir_1 = self.E
            dir_2 = self.W

        for speed in self.generate_purge_speeds(min_speed):
            if self.flipflop_purge:
                yield gcode.gen_direction_move(self.N, 0.6, 3000), b" Y shift"
                yield gcode.gen_direction_move(dir_1, purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"
                yield gcode.gen_direction_move(self.N, 0.9, 3000), b" Y shift"
                yield gcode.gen_direction_move(dir_2, purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"
            else:
                yield gcode.gen_direction_move(self.N, 0.9, 3000), b" Y shift"
                yield gcode.gen_direction_move(dir_1, purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"
                yield gcode.gen_direction_move(self.N, 0.6, 3000), b" Y shift"
                yield gcode.gen_direction_move(dir_2, purge_length, speed, new_e, feed_rate=purge_feed_rate), b" purge trail"

        if self.flipflop_purge:
            yield gcode.gen_direction_move(self.N, 0.6, 3000), b" Y shift"
        else:
            yield gcode.gen_direction_move(self.N, 0.9, 3000), b" Y shift"
        yield gcode.gen_direction_move(dir_1, purge_length, 2400, new_e, feed_rate=feed_rate), b" purge trail"

        if self.hw_config == E3DV6:
            # one more purge line for E3Dv6
            if self.flipflop_purge:
                yield gcode.gen_direction_move(self.N, 0.9, 3000), b" Y shift"
            else:
                yield gcode.gen_direction_move(self.N, 0.6, 3000), b" Y shift"
            yield gcode.gen_direction_move(dir_2, purge_length, min_speed, new_e, feed_rate=feed_rate), b" purge trail"

        # move to purge zone upper left corner
        yield b"G90", b" absolute positioning"
        yield self._get_wall_position_gcode(False, xy_speed)
        yield b"G91", b" relative positioning"

        # wall gcode
        for line in self._get_wall_gcode(False, new_e, min_speed, feed_rate):
            yield line

        yield new_e.get_retract_gcode()
        if new_e.wipe:
            yield gcode.gen_direction_move(self.S, new_e.wipe, 3000), b" wipe"

        yield b"G90", b" absolute positioning"
        yield b"G92 E0", b" reset extruder position"
        hop = self._get_z_hop(layer, z_hop, z_speed, old_e)
        if hop:
            yield hop
        yield None, b" TOWER END"

        # flip the flop
        self.flipflop_purge = not self.flipflop_purge

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
        self.log.debug("Adding purge tower infill")
        yield None, b" TOWER INFILL START"

        # minimum speed
        min_speed, feed_rate = layer.get_outer_perimeter_rates()

        # handle retraction
        retraction = self._get_retraction(e_pos, extruder)
        if retraction:
            yield retraction

        # handle z-hop
        hop = self._get_z_hop(layer, z_hop, z_speed, extruder)
        if hop:
            yield hop
        self.last_tower_z = self.last_tower_z + layer.height

        yield self._get_wall_position_gcode(self.flipflop_infill, xy_speed)
        yield ("G1 Z%.3f F%.1f" % (self.last_tower_z, z_speed)).encode(), b" move z close"
        yield b"G91", b" relative positioning"
        yield extruder.get_prime_gcode()

        # infill
        infill_x = self.wall_width/6
        infill_y = self.wall_height-0.3
        infill_angle = math.degrees(math.atan(infill_y/infill_x))
        infill_path_length = gcode.calculate_path_length((0,0), (infill_x, infill_y))

        # wall gcode
        for line in self._get_wall_gcode(self.flipflop_infill, extruder, 2400, feed_rate):
            yield line

        flip = self.flipflop_infill

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
        hop = self._get_z_hop(layer, z_hop, z_speed, extruder)
        if hop:
            yield hop
        yield b"G92 E0", b" reset extruder position"
        yield None, b" TOWER INFILL END"

        # flip the flop
        self.flipflop_infill = not self.flipflop_infill

if __name__ == "__main__":
    from logger import Logger
    log = Logger(".")
    st = SwitchTower(0, 1, log, PEEK)
    print(st.generate_purge_speeds(600))