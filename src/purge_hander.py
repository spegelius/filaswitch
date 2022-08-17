import math

from gcode import GCode, E, S, W, N, NE, NW, SE, SW, TYPE_CARTESIAN, TYPE_DELTA
from layer import Layer, ACT_SWITCH

from settings import (
    Settings,
    AUTO,
    RIGHT,
    LEFT,
    TOP,
    BOTTOM,
    INFILL_ZIGZAG,
    INFILL_BLOCKY,
    PURGE_HANDLING_BUCKET,
    PURGE_HANDLING_TOWER,
)

import utils

gcode = GCode()


class PurgeHandler:
    def __init__(self, logger, settings: Settings, towers):
        """
        Filament switch tower functionality
        :param logger: Logger object
        :param settings: settings object
        :param tower: Towers instance
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
        self.towers = towers

        try:
            self.bucket_retract_extra = settings.get_hw_config_float_value(
                "purge.bucket.retract.extra"
            )
        except ValueError:
            self.bucket_retract_extra = 0.0

        if self.settings.get_hw_config_value("purge.handling") == "bucket":
            self.purge_handling = PURGE_HANDLING_BUCKET
            self.get_purge_lines = self._get_purge_bucket_lines
        else:
            self.purge_handling = PURGE_HANDLING_TOWER
            self.get_purge_lines = self._get_tower_lines

        self.min_layer_h = self.towers.get_min_layer_h()
        self.log.debug("Tower min layer h: ()".format(self.min_layer_h))

        self.slot = 0
        self.slots = {}
        self.max_slots = self.towers.get_max_tower_count()

        # Hackish way to expand purge area by using 0.2 mm layer as the base value.
        # Tower needs more space with smaller layer heights...
        scale_factor = 0.2 / self.min_layer_h

        if self.purge_handling == PURGE_HANDLING_BUCKET:
            self.width = 60
        else:
            self.width = self.settings.get_hw_config_float_value(
                "prepurge.sweep.length"
            )
            pre_purge_lines = self.settings.get_hw_config_float_value(
                "prepurge.sweep.count"
            )

            self.pre_purge_sweep_gap = (
                self.settings.get_hw_config_float_value("prepurge.sweep.gap")
                * scale_factor
                * 1.1
            )
            self.pre_purge_jitter = (
                self.pre_purge_sweep_gap
                - self.settings.get_hw_config_float_value("prepurge.sweep.gap")
            )
            if self.pre_purge_jitter < 0:
                self.pre_purge_jitter = 0

            self.pre_purge_height = (
                pre_purge_lines * self.pre_purge_sweep_gap + self.pre_purge_jitter
            )

        # post purge line config
        self.purge_length_diff = 1
        self.purge_length = self.width + self.purge_length_diff

        self.purge_line_width = (
            self.settings.extrusion_width * self.settings.purge_multi / 100
        )
        # purge gap default is bit wider that the purge width so that the tower isn't too stuffed
        self.purge_gap_default = self.purge_line_width * 1.1

        # actual purge line count is 2x (forth and back) the setting scaled with 0.2/min_z_h
        self.purge_lines = int(self.settings.purge_lines * scale_factor)

        if self.purge_handling == PURGE_HANDLING_BUCKET:
            self.height = 1
        else:
            self.height = (
                self.pre_purge_height
                + (self.purge_lines * 2 - 1) * self.purge_gap_default
                + 0.2
            )

        self.wall_gap = 2 + self.settings.extrusion_width
        self.wall_width = self.width + self.wall_gap
        self.wall_height = self.height + 1.0

        # calculate total purge length
        extrusion_rate = utils.extrusion_feed_rate(
            self.purge_line_width, self.min_layer_h, 1.75
        )
        self.purge_e_length = extrusion_rate * self.purge_length * self.purge_lines * 2
        self.purge_e_length += (
            utils.extrusion_feed_rate(
                self.settings.extrusion_width, self.min_layer_h, 1.75
            )
            * (self.wall_height + self.wall_width)
            * 2
        )
        self.log.info(
            "Total purge length with {} purge lines is {}".format(
                self.settings.purge_lines, self.purge_e_length
            )
        )

        extrusion_speed = (extrusion_rate * self.purge_length) / (
            self.purge_length / self.settings.purge_speed
        )
        self.purge_e_speed = extrusion_speed * 60
        self.log.info(
            "Purge extrusion speed is {:0.2f} mm/s, {:0.2f} mm/min".format(
                extrusion_speed, self.purge_e_speed
            )
        )

        self.brim_width = self.settings.brim * self.settings.extrusion_width

        self.brim_done = False
        self.raft_done = False
        self.raft_width = self.wall_width + 2 * self.brim_width
        self.raft_height = (
            self.wall_height * self.max_slots
            + 2 * self.brim_width
            + (self.max_slots - 1) * self.settings.extrusion_width
        )
        self.raft_layer_height = None
        self.angle = 0

        self.start_pos_x = None
        self.start_pos_y = None

        self.brim_pos_x = None
        self.brim_pos_y = None

        self.raft_pos_x = None
        self.raft_pos_y = None

        # offset from model
        self.tower_offset = self.brim_width + self.settings.extrusion_width + 1

        # total values in terms of space taken
        self.total_height = self.raft_height + self.tower_offset
        self.total_width = self.raft_width
        self.extra_width = self.total_width - self.width
        self.log.debug(
            "Tower dimensions: width = {}, height = {}".format(
                self.total_width, self.total_height
            )
        )

        # build volume mid points, populated in find tower-function
        self.x_mid = None
        self.y_mid = None

        # amount of room for difference between tower height and model height
        self.z_slack_max = 1.2

        self.temperatures = {}
        self.warnings_shown = False

        self.current_z = 0
        self.e_pos = 0

        # temp settings
        self.g10 = (
            self.settings.get_hw_config_value("tool.temperature.command") == "G10"
        )
        self.tool_use_id = self.settings.get_hw_config_bool_value(
            "tool.temperature.use_id"
        )

        # infill speeds
        self.infill_speeds = [
            self.settings.default_speed,
            self.settings.default_speed,
            self.settings.default_speed,
            self.settings.default_speed,
            self.settings.default_speed,
            self.settings.default_speed,
        ]

        self.infill_functions = {
            INFILL_ZIGZAG: self.get_infill_lines_zigzag,
            INFILL_BLOCKY: self.get_infill_lines_blocky,
        }

        # wall speed
        if self.settings.purge_speed * 60 < self.settings.default_speed:
            self.wall_speed = self.settings.purge_speed * 60
        else:
            self.wall_speed = self.settings.default_speed

    def initialize_slots(self):
        """
        Initialize tower slot data
        :return:
        """
        for i in range(self.max_slots):
            self.slots[i] = {}
            self.slots[i]["last_z"] = self.settings.z_offset
            self.slots[i]["horizontal_dir"] = self.E
            self.slots[i]["vertical_dir"] = self.N
            self.slots[i]["flipflop_infill"] = False
            self.slots[i]["jitter"] = {self.N: False, self.S: False}

    def rotate_tower(self, direction):
        """
        Rotates coordinate system by given angle
        :param direction: angle (counter clockwise from East)
        :return:
        """
        self.E = gcode.rotate(self.E, direction)
        self.S = gcode.rotate(self.S, direction)
        self.W = gcode.rotate(self.W, direction)
        self.N = gcode.rotate(self.N, direction)
        self.NE = gcode.rotate(self.NE, direction)
        self.NW = gcode.rotate(self.NW, direction)
        self.SE = gcode.rotate(self.SE, direction)
        self.SW = gcode.rotate(self.SW, direction)

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

                if self.start_pos_y < bed_y_max - self.total_height:
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

        if not self.settings.tower_force or not self.settings.tower_force[0]:
            if self.settings.tower_position == AUTO:
                raise ValueError("Not enough space for the tower inside the bed!")
            raise ValueError(
                "Not enough room for tower using selected position %s"
                % self.settings.tower_position
            )

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
        bed_r = self.settings.stroke_x / 2

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
                x1 = self.x_mid - self.total_width / 2
                x2 = self.x_mid + self.total_width / 2

                if check_coordinate(x1, y) and check_coordinate(x2, y):
                    self.start_pos_y = y_max + self.tower_offset
                    self.start_pos_x = x1 + self.extra_width / 2
                    return position

                # x3 = -self.total_width/2
                # x4 = self.total_width/2
                # if check_coordinate(x3, y) and check_coordinate(x4, y):
                #     self.start_pos_y = y_max + self.tower_offset
                #     self.start_pos_x = x3 + self.extra_width/2
                #     return position

            elif position == RIGHT:
                x = x_max + self.total_height
                y1 = self.y_mid + self.total_width / 2
                y2 = self.y_mid - self.total_width / 2
                if check_coordinate(x, y1) and check_coordinate(x, y2):
                    self.start_pos_y = y1 - self.extra_width / 2
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
                    self.start_pos_x = x2 - self.extra_width / 2
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
                    self.start_pos_y = y1 + self.extra_width / 2
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

        if not self.settings.tower_force[0]:
            if self.settings.tower_position == AUTO:
                raise ValueError("Not enough space for the tower inside the bed!")
            raise ValueError(
                "Not enough room for tower using selected position %s"
                % self.settings.tower_position
            )

    def find_tower_position(self, x_max, x_min, y_max, y_min):
        """
        Find position for purge tower
        :param x_max: print objects x max
        :param x_min: print objects x min
        :param y_max: print objects y max
        :param y_min: print objects y min
        :return:
        """

        if self.purge_handling == PURGE_HANDLING_BUCKET:
            return

        self.x_mid = (x_max + x_min) / 2
        self.y_mid = (y_max + y_min) / 2

        # print("maxes", x_max, y_max)
        # print("mids", self.x_mid, self.y_mid)

        if self.settings.machine_type == TYPE_CARTESIAN:
            position = self._cartesian_position(x_max, x_min, y_max, y_min)
        else:
            position = self._delta_position(x_max, x_min, y_max, y_min)

        if self.settings.tower_force and self.settings.tower_force[0]:
            self.start_pos_x = self.settings.tower_force[0]
            self.start_pos_y = self.settings.tower_force[1]
            position = "FORCED"

        self.log.info(
            "Tower start coordinate: X%.3f, Y%.3f, position %s"
            % (self.start_pos_x, self.start_pos_y, position)
        )

        # get raft position
        x, y = gcode.get_coordinates_by_offsets(
            self.E,
            self.start_pos_x,
            self.start_pos_y,
            -self.brim_width,
            -self.brim_width,
        )
        self.brim_pos_x, self.brim_pos_y = gcode.get_coordinates_by_offsets(
            self.E, x, y, -self.wall_gap / 2 - 1 / 2, -0.5
        )
        self.raft_pos_x, self.raft_pos_y = gcode.get_coordinates_by_offsets(
            self.E,
            self.brim_pos_x,
            self.brim_pos_y,
            self.brim_width + 0.5,
            self.brim_width - 0.3,
        )

        # init slots after tower rotation is done
        self.initialize_slots()

    def generate_purge_speeds(self, min_speed, lines):
        """
        Initialize a list for purge speeds
        :param min_speed: minimum speed for last lines
        :param lines: purge line count
        :return: list of print speeds
        """
        max_speed = self.settings.purge_speed * 60
        speed = min_speed
        min_speed_lines = 2
        purge_speeds = []
        for i in range(lines):
            if i >= min_speed_lines:
                speed = max_speed
            purge_speeds.append(speed)
        return purge_speeds

    def get_temperature_gcode(self, temperature, extruder, wait=False):
        """
        Generate temperature control gcode based on hw settings
        :param temperature: target temperature
        :param extruder: extruder object
        :param wait: to wait for the temperature or not
        :return: gcode lines
        """

        if wait:
            if self.g10:
                yield gcode.gen_temperature_nowait_tool(
                    temperature, extruder.tool, g10=self.g10
                ), None
                yield gcode.gen_wait_tool_temp(extruder.tool), None
            else:
                if self.tool_use_id:
                    yield gcode.gen_temperature_wait_tool(
                        temperature, extruder.tool
                    ), None
                else:
                    yield gcode.gen_temperature_wait(temperature)
        else:
            if self.tool_use_id:
                yield gcode.gen_temperature_nowait_tool(
                    temperature, extruder.tool, g10=self.g10
                ), None
            else:
                yield gcode.gen_temperature_nowait(temperature), None

    def get_pre_switch_gcode_bucket(self):
        """
        Generates pre tool switch g-code
        :return:
        """

        e_length = self.settings.get_hw_config_float_value("prepurge.extrusion.length")

        purge_speed = self.settings.get_hw_config_float_value(
            "prepurge.extrusion.speed"
        )
        motor_current = self.settings.get_hw_config_int_value("motor.current.load")

        try:
            pre_retract = self.settings.get_hw_config_int_value(
                "prepurge.initial.retract"
            )
            pre_retract_speed = self.settings.get_hw_config_int_value(
                "prepurge.initial.retract.speed"
            )
            pre_retract_pause = self.settings.get_hw_config_int_value(
                "prepurge.initial.pause"
            )
        except ValueError:
            pre_retract = None
            pre_retract_speed = None
            pre_retract_pause = None

        if motor_current:
            yield gcode.gen_motor_current("E", motor_current), b" adjust current"

        # pre-purge section
        if pre_retract:
            yield gcode.gen_extruder_move(
                -pre_retract, pre_retract_speed
            ), b" prepurge initial retract"
            if pre_retract_pause:
                yield gcode.gen_pause(pre_retract_pause), b" pre-retract initial pause"

        # for purge
        if pre_retract:
            # prime nozzle for the pre-purge after pre-retract
            yield gcode.gen_extruder_move(
                pre_retract, purge_speed
            ), b" prepurge initial prime"

        # purge
        yield gcode.gen_extruder_move(e_length, purge_speed), b" prepurge/ramming"

        # rapid retract section
        rr_lengths = self.settings.get_hw_config_array(
            "rapid.retract.initial[].length", float
        )
        rr_speeds = self.settings.get_hw_config_array(
            "rapid.retract.initial[].speed", float
        )

        # sanity check
        if len(rr_lengths) != len(rr_speeds):
            raise ValueError(
                "not equal amount of rapid.retract.initial length and speed parameters. Check hwcfg"
            )
        if len(rr_lengths) == 0:
            if not self.warnings_shown:
                self.log.warning(
                    "No rapid.retract.initial[N].length or .speed found. Please check the HW-config"
                )

        for length, speed in zip(rr_lengths, rr_speeds):
            yield gcode.gen_extruder_move(-length, speed), b" rapid retract"

        pause = self.settings.get_hw_config_float_value("rapid.retract.pause")
        if pause:
            yield gcode.gen_pause(pause), b" cooling period"

        rr_long_lengths = self.settings.get_hw_config_array(
            "rapid.retract.long[].length", float
        )
        rr_long_speeds = self.settings.get_hw_config_array(
            "rapid.retract.long[].speed", float
        )

        if len(rr_long_lengths) != len(rr_long_speeds):
            raise ValueError(
                "Not equal amount of rapid.retract.long length and speed parameters. Check hwcfg"
            )
        if len(rr_long_lengths) == 0:
            if not self.warnings_shown:
                self.log.warning(
                    "No rapid.retract.long[N].length or .speed found. Please check the HW-config"
                )

        for length, speed in zip(rr_long_lengths, rr_long_speeds):
            yield gcode.gen_extruder_move(-length, speed), b" long retract"

    def get_pre_switch_gcode(self, old_e, new_e, layer_h):
        """
        Generates pre tool switch g-code
        :param old_e: active extruder
        :param new_e: new extruder
        :param layer_h: current layer height
        :return:
        """

        e_length = self.settings.get_hw_config_float_value(
            "prepurge.sweep.extrusion.length"
        )

        sweep_speed = self.settings.get_hw_config_float_value("prepurge.sweep.speed")
        sweep_gap_speed = self.settings.get_hw_config_float_value(
            "prepurge.sweep.gap.speed"
        )
        motor_current = self.settings.get_hw_config_int_value("motor.current.load")

        try:
            pre_retract = self.settings.get_hw_config_int_value(
                "prepurge.initial.retract"
            )
            pre_retract_speed = self.settings.get_hw_config_int_value(
                "prepurge.initial.retract.speed"
            )
            pre_retract_pause = self.settings.get_hw_config_int_value(
                "prepurge.initial.pause"
            )
        except ValueError:
            pre_retract = None
            pre_retract_speed = None
            pre_retract_pause = None

        horizontal_dir = self.slots[self.slot]["horizontal_dir"]
        vertical_dir = self.slots[self.slot]["vertical_dir"]

        if motor_current:
            yield gcode.gen_motor_current("E", motor_current), b" adjust current"

        # jitter
        if self.pre_purge_jitter and self.slots[self.slot]["jitter"][vertical_dir]:
            yield gcode.gen_direction_move(
                vertical_dir, self.pre_purge_jitter, sweep_gap_speed, layer_h
            ), b" pre-purge jitter"

        # pre-purge section
        rr_wipe = self.settings.get_hw_config_bool_value("rapid.retract.wipe")
        pre_retract_wipe_length = 10

        if pre_retract:
            if rr_wipe:
                yield gcode.gen_direction_move(
                    horizontal_dir,
                    pre_retract_wipe_length,
                    pre_retract_speed,
                    layer_h,
                    extruder=old_e,
                    e_speed=True,
                    e_length=-pre_retract,
                ), b" pre-retract with wipe"
            else:
                yield gcode.gen_extruder_move(
                    -pre_retract, pre_retract_speed
                ), b" prepurge initial retract"

            if pre_retract_pause:
                if rr_wipe:
                    speed = (self.width * 2 - 10) / pre_retract_pause * 1000 * 60
                    yield gcode.gen_direction_move(
                        horizontal_dir,
                        self.width - pre_retract_wipe_length,
                        speed,
                        layer_h,
                    ), b" pre-retract initial pause wipe"
                    yield gcode.gen_direction_move(
                        gcode.opposite_dir(horizontal_dir), self.width, speed, layer_h
                    ), b" pre-retract initial pause wipe"
                else:
                    yield gcode.gen_pause(
                        pre_retract_pause
                    ), b" pre-retract initial pause"
            if not pre_retract_pause and rr_wipe:
                # reset nozzle position after wipe
                yield gcode.gen_direction_move(
                    gcode.opposite_dir(horizontal_dir),
                    pre_retract_wipe_length,
                    self.settings.travel_xy_speed,
                    layer_h,
                ), b" nozzle pos reset"

        if pre_retract:
            # prime nozzle for the pre-purge after pre-retract
            speed = e_length / (self.width / (sweep_speed / 60)) * 60
            yield gcode.gen_extruder_move(
                pre_retract, speed
            ), b" prepurge initial prime"

        sweeps = self.settings.get_hw_config_int_value("prepurge.sweep.count")
        for i in range(sweeps):
            yield gcode.gen_direction_move(
                horizontal_dir,
                self.width,
                sweep_speed,
                layer_h,
                extruder=old_e,
                e_length=e_length,
            ), b" purge trail"
            horizontal_dir = gcode.opposite_dir(horizontal_dir)
            # in wipe mode, save last vertical move to wipe
            if i < sweeps - 1 or not rr_wipe:
                yield gcode.gen_direction_move(
                    vertical_dir, self.pre_purge_sweep_gap, sweep_gap_speed, layer_h
                ), b" Y shift"

        # rapid retract section
        rr_lengths = self.settings.get_hw_config_array(
            "rapid.retract.initial[].length", float
        )
        rr_speeds = self.settings.get_hw_config_array(
            "rapid.retract.initial[].speed", float
        )
        rr_wipe_length = 8
        rr_total_wipe = 0

        # sanity check. TODO: move to settings hwcfg parsing
        if len(rr_lengths) != len(rr_speeds):
            raise ValueError(
                "not equal amount of rapid.retract.initial length and speed parameters. Check hwcfg"
            )
        if len(rr_lengths) == 0:
            if not self.warnings_shown:
                self.log.warning(
                    "No rapid.retract.initial[N].length or .speed found. Please check the HW-config"
                )

        for i, values in enumerate(zip(rr_lengths, rr_speeds)):
            length, speed = values
            if rr_wipe:
                # last vertical move with wipe
                if i == 0:
                    if length < 2:
                        yr_len = length
                    else:
                        yr_len = 2

                    yield gcode.gen_direction_move(
                        vertical_dir,
                        self.pre_purge_sweep_gap,
                        speed,
                        layer_h,
                        extruder=old_e,
                        e_speed=True,
                        e_length=-yr_len,
                    ), b" Y shift + rapid retract with wipe"
                    length -= yr_len
                if not length:
                    continue
                if rr_total_wipe + rr_wipe_length < self.width:
                    yield gcode.gen_direction_move(
                        horizontal_dir,
                        rr_wipe_length,
                        speed,
                        layer_h,
                        extruder=old_e,
                        e_speed=True,
                        e_length=-length,
                    ), b" rapid retract with wipe"
                    rr_total_wipe += rr_wipe_length
                else:
                    # no wipe left
                    yield gcode.gen_extruder_move(-length, speed), b" rapid retract"
            else:
                yield gcode.gen_extruder_move(-length, speed), b" rapid retract"

        if rr_wipe:
            length = self.width - rr_total_wipe
            yield gcode.gen_direction_move(
                horizontal_dir, length, self.settings.travel_xy_speed, layer_h
            ), b" wipe"

        # jitter
        if self.pre_purge_jitter and not self.slots[self.slot]["jitter"][vertical_dir]:
            yield gcode.gen_direction_move(
                vertical_dir, self.pre_purge_jitter, sweep_gap_speed, layer_h
            ), b" pre-purge jitter"

        # update jitter flag
        if self.pre_purge_jitter:
            self.slots[self.slot]["jitter"][vertical_dir] = not self.slots[self.slot][
                "jitter"
            ][vertical_dir]

        # check purge len diff
        if self.purge_length_diff:
            direction = (
                horizontal_dir if rr_wipe else gcode.opposite_dir(horizontal_dir)
            )
            yield gcode.gen_direction_move(
                direction,
                self.purge_length_diff / 2,
                self.settings.travel_xy_speed,
                layer_h,
            ), b" pre-purge x adjust"

        pause = self.settings.get_hw_config_float_value("rapid.retract.pause")
        if pause:
            if rr_wipe:
                speed = self.purge_length * 2 / pause * 1000 * 60
                yield gcode.gen_direction_move(
                    gcode.opposite_dir(horizontal_dir), self.width, speed, layer_h
                ), b" cooling period move"
                yield gcode.gen_direction_move(
                    horizontal_dir, self.width, speed, layer_h
                ), b" cooling period move"
            else:
                yield gcode.gen_pause(pause), b" cooling period"

        rr_long_lengths = self.settings.get_hw_config_array(
            "rapid.retract.long[].length", float
        )
        rr_long_speeds = self.settings.get_hw_config_array(
            "rapid.retract.long[].speed", float
        )

        #  TODO: move to settings hwcfg parsing
        if len(rr_long_lengths) != len(rr_long_speeds):
            raise ValueError(
                "Not equal amount of rapid.retract.long length and speed parameters. Check hwcfg"
            )
        if len(rr_long_lengths) == 0:
            if not self.warnings_shown:
                self.log.warning(
                    "No rapid.retract.long[N].length or .speed found. Please check the HW-config"
                )

        rr_wipe_length = self.width / len(rr_long_lengths)
        for length, speed in zip(rr_long_lengths, rr_long_speeds):
            if rr_wipe:
                yield gcode.gen_direction_move(
                    gcode.opposite_dir(horizontal_dir),
                    rr_wipe_length,
                    speed,
                    layer_h,
                    extruder=old_e,
                    e_length=-length,
                    e_speed=True,
                ), b" long retract with wipe"
            else:
                yield gcode.gen_extruder_move(-length, speed), b" long retract"

        # Cooling movements, as seen in Slic3r gcode, need to override length values from extruder, modified in gcode.py
        rr_cool_lengths = self.settings.get_hw_config_array(
            "rapid.retract.cool[].length", float
        )
        rr_cool_speeds = self.settings.get_hw_config_array(
            "rapid.retract.cool[].speed", float
        )

        #  TODO: move to settings hwcfg parsing
        if len(rr_cool_lengths) != len(rr_cool_speeds):
            raise ValueError(
                "not equal amount of rapid.retract.cool length and speed parameters. Check hwcfg"
            )
        if len(rr_cool_lengths) == 0:
            if not self.warnings_shown:
                self.log.warning("No cooling steps. That's OK.")
        else:
            self.log.debug("Cooling movements enabled")

        for length, speed in zip(rr_cool_lengths, rr_cool_speeds):
            yield gcode.gen_direction_move(
                horizontal_dir,
                self.width,
                speed,
                layer_h,
                extruder=old_e,
                e_length=length,
            ), b" cooling"
            horizontal_dir = gcode.opposite_dir(horizontal_dir)

        # update slot horizontal dir
        self.slots[self.slot]["horizontal_dir"] = horizontal_dir

    def get_post_switch_gcode_bucket(self):
        """
        Generate gcode for actions after tool change
        :return:
        """

        # feed new filament
        values = []
        i = 0

        while True:
            try:
                feed_len = self.settings.get_hw_config_float_value(
                    "feed[{}].length".format(i)
                )
                feed_speed = self.settings.get_hw_config_float_value(
                    "feed[{}].speed".format(i)
                )
                values.append((feed_len, feed_speed))
                i += 1
            except ValueError:
                if i == 0 and not self.warnings_shown:
                    self.log.warning(
                        "No feed[N].length or .speed found. Please check the HW-config"
                    )
                break

        for feed_len, feed_speed in values:
            yield gcode.gen_extruder_move(feed_len, feed_speed), b" feed"

        # no need to show the warnings again
        self.warnings_shown = True

    def get_post_switch_gcode(self, extruder, layer_h):
        """
        Generate gcode for actions after tool change
        :param extruder: extruder
        :param layer_h: current layer height
        :return:
        """
        # should we move head while feeding?
        feedtrail = self.settings.get_hw_config_value("feed.trail")
        # feed new filament
        values = []
        i = 0

        if feedtrail == "True":
            self.log.debug("Feedtrail enabled")
            horizontal_dir = self.slots[self.slot]["horizontal_dir"]
            while True:
                try:
                    feed_len = self.settings.get_hw_config_float_value(
                        "feed[{}].length".format(i)
                    )
                    feed_speed = self.settings.get_hw_config_float_value(
                        "feed[{}].speed".format(i)
                    )
                    yield gcode.gen_direction_move(
                        horizontal_dir,
                        self.width,
                        feed_speed,
                        layer_h,
                        extruder=extruder,
                        e_length=feed_len,
                        e_speed=True,
                    ), b" prime move"
                    horizontal_dir = gcode.opposite_dir(horizontal_dir)
                    i += 1
                except ValueError:
                    if i == 0 and not self.warnings_shown:
                        self.log.warning("No prime move steps. That's OK.")
                    break

            self.slots[self.slot]["horizontal_dir"] = horizontal_dir
        else:
            while True:
                try:
                    feed_len = self.settings.get_hw_config_float_value(
                        "feed[{}].length".format(i)
                    )
                    feed_speed = self.settings.get_hw_config_float_value(
                        "feed[{}].speed".format(i)
                    )
                    values.append((feed_len, feed_speed))
                    i += 1
                except ValueError:
                    if i == 0 and not self.warnings_shown:
                        self.log.warning(
                            "No feed[N].length or .speed found. Please check the HW-config"
                        )
                    break

            for feed_len, feed_speed in values:
                yield gcode.gen_extruder_move(feed_len, feed_speed), b" feed"

        # prime trail
        prime_e_length = self.settings.get_hw_config_float_value(
            "prime.trail.extrusion.length"
        )
        prime_trail_speed = self.settings.get_hw_config_float_value("prime.trail.speed")
        yield gcode.gen_direction_move(
            self.slots[self.slot]["horizontal_dir"],
            self.width,
            prime_trail_speed,
            layer_h,
            extruder=extruder,
            e_length=prime_e_length,
        ), b" prime trail"

        self.slots[self.slot]["horizontal_dir"] = gcode.opposite_dir(
            self.slots[self.slot]["horizontal_dir"]
        )

        # no need to show the warnings again
        self.warnings_shown = True

    def get_brim_lines(self, current_z, layer_h, extruder):
        """
        G-code lines for the brim
        :param current_z: current layer z
        :param layer_h: layer height
        :param extruder: extruder object
        :return: list of cmd, comment tuples
        """
        yield None, b" TOWER BRIM START"

        self.raft_layer_height = layer_h
        raft_layer_z = self.raft_layer_height + self.settings.z_offset
        feed_multi = self.settings.raft_multi / 100

        if extruder.z_hop:
            z_hop = current_z + extruder.z_hop + self.settings.z_offset
            yield gcode.gen_z_move(z_hop, self.settings.travel_z_speed), b" z-hop"
            self.current_z = z_hop

        yield gcode.gen_head_move(
            self.brim_pos_x, self.brim_pos_y, self.settings.travel_xy_speed
        ), b" move to brim zone"

        yield gcode.gen_z_move(
            raft_layer_z, self.settings.travel_z_speed
        ), b" move z close"
        self.current_z = raft_layer_z

        prime = self._get_prime(extruder)
        if prime:
            yield prime

        yield gcode.gen_relative_positioning(), b" relative positioning"

        height = self.raft_height
        width = self.raft_width
        speed = self.settings.first_layer_speed

        # first round
        yield gcode.gen_direction_move(
            self.E,
            width,
            speed,
            self.raft_layer_height,
            extruder=extruder,
            feed_multi=feed_multi,
        ), b" raft wall"
        yield gcode.gen_direction_move(
            self.N,
            height,
            speed,
            self.raft_layer_height,
            extruder=extruder,
            feed_multi=feed_multi,
        ), b" raft wall"
        yield gcode.gen_direction_move(
            self.W,
            width,
            speed,
            self.raft_layer_height,
            extruder=extruder,
            feed_multi=feed_multi,
        ), b" raft wall"
        height -= self.settings.extrusion_width
        yield gcode.gen_direction_move(
            self.S,
            height,
            speed,
            self.raft_layer_height,
            extruder=extruder,
            feed_multi=feed_multi,
        ), b" raft wall"
        width -= self.settings.extrusion_width

        for bl in range(self.settings.brim - 1):
            yield gcode.gen_direction_move(
                self.E,
                width,
                speed,
                self.raft_layer_height,
                extruder=extruder,
                feed_multi=feed_multi,
            ), b" raft wall"
            width -= self.settings.extrusion_width
            height -= self.settings.extrusion_width
            yield gcode.gen_direction_move(
                self.N,
                height,
                speed,
                self.raft_layer_height,
                extruder=extruder,
                feed_multi=feed_multi,
            ), b" raft wall"
            yield gcode.gen_direction_move(
                self.W,
                width,
                speed,
                self.raft_layer_height,
                extruder=extruder,
                feed_multi=feed_multi,
            ), b" raft wall"
            height -= self.settings.extrusion_width
            yield gcode.gen_direction_move(
                self.S,
                height,
                speed,
                self.raft_layer_height,
                extruder=extruder,
                feed_multi=feed_multi,
            ), b" raft wall"
            width -= self.settings.extrusion_width

        yield extruder.get_retract_gcode()
        self.e_pos = -extruder.retract

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        yield None, b" TOWER BRIM END"

    def get_raft_lines(self, current_z, layer_h, extruder, slot_count):
        """
        G-code lines for the raft
        :param current_z: current z position
        :param layer_h: layer_h
        :param extruder: first extruder object
        :param slot_count: slots needing raft
        :return: list of cmd, comment tuples
        """
        self.log.debug("Raft begin")
        if slot_count:
            height = (
                self.wall_height * slot_count
                + (slot_count - 1) * self.settings.extrusion_width
                + 2 * 0.3
            )
        else:
            return

        yield None, b" TOWER RAFT START"

        self.raft_layer_height = layer_h
        raft_layer_z = self.raft_layer_height + self.settings.z_offset
        feed_multi = self.settings.raft_multi / 100

        if extruder.z_hop:
            z_hop = current_z + extruder.z_hop + self.settings.z_offset
            yield gcode.gen_z_move(z_hop, self.settings.travel_z_speed), b" z-hop"
            self.current_z = z_hop

        x, y = gcode.get_coordinates_by_offsets(
            self.E,
            self.raft_pos_x,
            self.raft_pos_y,
            0,
            self.wall_height * (self.max_slots - slot_count),
        )
        yield gcode.gen_head_move(
            x, y, self.settings.travel_xy_speed
        ), b" move to raft zone"
        yield gcode.gen_z_move(
            raft_layer_z, self.settings.travel_z_speed
        ), b" move z close"
        self.current_z = raft_layer_z

        prime = self._get_prime(extruder)
        if prime:
            yield prime

        yield gcode.gen_relative_positioning(), b" relative positioning"

        feed_multi = 1.3 * feed_multi
        speed = self.settings.first_layer_speed

        raft_lines = int((self.raft_width - 2 * self.brim_width) / 2)
        raft_line_gap = (self.raft_width - 2 * self.brim_width) / raft_lines / 2

        for _ in range(raft_lines):
            yield gcode.gen_direction_move(
                self.N,
                height,
                speed,
                self.raft_layer_height,
                extruder=extruder,
                feed_multi=feed_multi,
            ), b" raft1"
            yield gcode.gen_direction_move(
                self.E, raft_line_gap, speed, self.raft_layer_height
            ), b" raft2"
            yield gcode.gen_direction_move(
                self.S,
                height,
                speed,
                self.raft_layer_height,
                extruder=extruder,
                feed_multi=feed_multi,
            ), b" raft3"
            yield gcode.gen_direction_move(
                self.E, raft_line_gap, speed, self.raft_layer_height
            ), b" raft4"

        yield extruder.get_retract_gcode()
        self.e_pos = -extruder.retract

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        yield None, b" TOWER RAFT END"

        # update slot z values
        for i in range(slot_count):
            slot = i + (self.max_slots - slot_count)
            self.slots[slot]["last_z"] = (
                self.slots[slot]["last_z"] + self.raft_layer_height
            )

    def _get_z_hop(self):
        """
        Get g-code for z-hop
        :return: G-code for z-hop or None
        """
        # just hop when doing bucket
        tower_z_hop = self.settings.get_hw_config_float_value("tool.tower.zhop")
        if self.purge_handling == PURGE_HANDLING_BUCKET:
            if tower_z_hop > 0:
                self.current_z += tower_z_hop
                return (
                    gcode.gen_z_move(self.current_z, self.settings.travel_z_speed),
                    b" z-hop",
                )

        # calculate needed z-hop based on tower height
        max_z = 0
        for s in self.slots:
            if s > self.slot:
                continue
            elif self.slots[s]["last_z"] > max_z:
                max_z = self.slots[s]["last_z"]

        current_z = round(self.current_z + self.settings.z_offset, 5)
        if current_z >= max_z:
            new_z_hop = current_z
        else:
            new_z_hop = max_z

        if tower_z_hop:
            new_z_hop += tower_z_hop
        if new_z_hop > current_z:
            self.current_z = new_z_hop
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
            return extruder.get_prime_gcode(change=-prime, comment=b" tower prime")

    def _get_wall_position_gcode(self, x_direction, y_direction, slots, infill=False):
        """
        Retun g-code line for positioning head for wall print
        :param x_direction: current x direction
        :param y_direction: current y direction
        :param infill: infill wall or not
        :return: g-code line
        """
        if infill:
            h = (
                self.wall_height * slots
                + (slots - 1) * self.settings.extrusion_width
            )
        else:
            h = self.wall_height

        y_pos = (self.wall_height + self.settings.extrusion_width) * self.slot

        if x_direction == self.E:
            x_offset = -self.wall_gap / 2 - 1 / 2
        else:
            x_offset = self.wall_width - self.wall_gap / 2 - 1 / 2

        if y_direction == self.N:
            y_offset = h - 0.5 + y_pos
        else:
            y_offset = -0.5 + y_pos

        x, y = gcode.get_coordinates_by_offsets(
            self.E, self.start_pos_x, self.start_pos_y, x_offset, y_offset
        )
        # self.log.debug(self.start_pos_x, self.start_pos_y, x, y)
        return (
            gcode.gen_head_move(x, y, self.settings.travel_xy_speed),
            b" move to purge zone",
        )

    def _get_wall_gcode(
        self, extruder, layer_h, last_speed, x_direction, y_direction, slots, infill=False
    ):
        """
        Return g-code for printing the purge tower walls
        :param extruder: extruder object
        :param layer_h: current layer height
        :param last_speed: speed for the last line
        :param x_direction: current x direction
        :param y_direction: current y direction
        :param infill: wall for infill or not
        :return: list of g-code lines
        """

        x_dir = x_direction
        y_dir = gcode.opposite_dir(y_direction)

        if infill:
            h = (
                self.wall_height * slots
                + (slots - 1) * self.settings.extrusion_width
            )
        else:
            h = self.wall_height

        last_y = h - 0.3

        yield gcode.gen_direction_move(
            x_dir, self.wall_width, self.wall_speed, layer_h, extruder=extruder, feed_multi=1.05
        ), b" wall"
        yield gcode.gen_direction_move(
            y_dir, h, self.wall_speed, layer_h, extruder=extruder, feed_multi=1.05
        ), b" wall"

        x_dir = gcode.opposite_dir(x_dir)
        y_dir = gcode.opposite_dir(y_dir)

        yield gcode.gen_direction_move(
            x_dir, self.wall_width, self.wall_speed, layer_h, extruder=extruder, feed_multi=1.05
        ), b" wall"
        yield gcode.gen_direction_move(
            y_dir, last_y, last_speed, layer_h, extruder=extruder, feed_multi=1.05, last_line=True
        ), b" wall"

    def _calculate_purge_values(self, layer_h, extruder):
        """
        Calculate purge line count, gap and purge feed multiplier for given layer.
        :param layer_h: layer height
        :param extruder: extruder object
        :return: gap, purge feed multi, purge lines
        """
        # calculate wall e length and subtract it from expected purge length
        wall_e_length = extruder.get_feed_length(
            (self.wall_width + self.wall_height) * 2 * 1.05, layer_h
        )
        purge_e = self.purge_e_length - wall_e_length

        # calculate new line counts (fractional, whole) based on layer height feed rate
        lines = purge_e / (
            utils.extrusion_feed_rate(self.purge_line_width, layer_h, 1.75)
            * self.purge_length
            * 2
        )
        whole_lines = math.floor(lines)

        if not whole_lines:
            whole_lines = 1
        if whole_lines / self.purge_lines < 0.5:
            whole_lines = int(self.purge_lines / 2)

        # calculate new purge line gap based on line count differences
        purge_gap = self.purge_gap_default
        line_diff = self.purge_lines - whole_lines
        if line_diff and whole_lines > 1:
            purge_gap = self.purge_lines / whole_lines * purge_gap

        # adjust purge feed multiplier
        purge_multi = self.settings.purge_multi / 100 * lines / whole_lines

        return purge_gap, purge_multi, whole_lines

    def _get_purge_bucket_lines(self, current_z, e_pos, old_e, new_e, layer_nr):
        """
        G-code for purge bucket
        :param current_z: current layer z
        :param e_pos: extruder position
        :param old_e: old extruder
        :param new_e: new extruder
        :param layer_nr: layer number
        :return: list of cmd, comment tuples
        """
        # TODO: move this to global state
        self.current_z = current_z
        self.e_pos = e_pos
        yield None, b" PURGE START"

        # handle retraction
        yield self._get_retraction(old_e)

        # handle z-hop
        z_hop = self._get_z_hop()
        if z_hop:
            yield z_hop

        # move to purge bucket
        lines = self.settings.get_hw_config_array("purge.bucket.pre.line[]", str)
        if not lines:
            raise ValueError(
                "no purge.bucket.pre.line[] lines defined, cannot move to bucket"
            )
        for line in lines:
            yield line.encode(), b" move to purge bucket"

        # temperature handling
        new_temp = new_e.get_temperature(layer_nr)
        old_temp = self.temperatures.get(old_e.tool, old_e.get_temperature(layer_nr))
        self.temperatures[new_e.tool] = new_temp
        if new_temp == old_temp:
            new_temp = None

        # Pre-switch temp handling. Lower temp by setting value before purge
        temp_diff = self.settings.get_hw_config_float_value(
            "prepurge.temperature.change"
        )
        pre_temp = old_e.get_temperature(layer_nr) + temp_diff
        for line in self.get_temperature_gcode(pre_temp, old_e):
            yield line

        if self.g10 or self.tool_use_id:
            # set also new e temp since it needs to stay the same after filament change
            for line in self.get_temperature_gcode(
                pre_temp, new_e, wait=not utils.is_float_zero(temp_diff, 2)
            ):
                yield line

        # prime
        yield self._get_prime(old_e)

        # pre-switch purge
        for line in self.get_pre_switch_gcode_bucket():
            yield line

        if self.settings.get_hw_config_bool_value("tool.wait_on_change"):
            yield b"G4 S0", b" wait"

        yield gcode.gen_tool_change(new_e.tool), b" change tool"

        if self.settings.get_hw_config_bool_value("tool.reset_feed"):
            yield b"M220 S100", b" reset feedrate"

        if self.settings.get_hw_config_bool_value("tool.wait_on_change"):
            yield b"G4 S0", b" wait"

        # feed new filament
        for line in self.get_post_switch_gcode_bucket():
            yield line

        # restore temperatures
        for line in self.get_temperature_gcode(new_e.get_temperature(layer_nr), new_e):
            yield line
        if self.g10 or self.tool_use_id:
            for line in self.get_temperature_gcode(
                old_e.get_temperature(layer_nr), old_e
            ):
                yield line

        # purge
        yield gcode.gen_extruder_move(
            self.purge_e_length - 10, self.purge_e_speed
        ), b" purge"
        yield gcode.gen_extruder_move(10, 80), b" slow purge"

        # retract
        yield gcode.gen_pause(3000), b" ooze pause"
        yield new_e.get_retract_gcode(change=self.bucket_retract_extra)
        self.e_pos = -new_e.retract

        # end movements
        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        lines = self.settings.get_hw_config_array("purge.bucket.post.line[]", str)
        if not lines:
            raise ValueError(
                "no purge.bucket.post.line[] lines defined, cannot move from bucket"
            )
        for line in lines:
            yield line.encode(), b" move from purge bucket"

        yield gcode.gen_relative_e(), b" relative E"
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        yield None, b" PURGE END"

        # readjust motor current
        motor_current = self.settings.get_hw_config_int_value("motor.current.run")
        if motor_current:
            yield gcode.gen_motor_current("E", motor_current), b" adjust current"

    def _get_tower_lines(self, layer_z, e_pos, old_e, new_e, layer_nr):
        """
        G-code for purge tower
        :param layer_z: current layer z
        :param e_pos: extruder position
        :param old_e: old extruder
        :param new_e: new extruder
        :param layer_nr: layer number
        :return: list of cmd, comment tuples
        """
        self.current_z = layer_z

        # TODO: move this to global state
        self.e_pos = e_pos

        self.slot = self.towers.get_tower_id_by_z_and_tool(layer_z, new_e.tool)

        # calculate layer height
        if self.settings.sparse_layers:
            layer_h = round(self.current_z - self.slots[self.slot]["last_z"], 5)
        else:
            layer_h = self.towers.max_layer_h
        if layer_h < self.min_layer_h:
            layer_h = self.min_layer_h
        tower_z = round(layer_h + self.slots[self.slot]["last_z"], 5)

        # add brim if not added
        if not self.brim_done:
            for line in self.get_brim_lines(self.current_z, layer_h, old_e):
                yield line
            self.brim_done = True
            if self.settings.force_raft and not self.raft_done:
                for line in self.get_raft_lines(
                    self.current_z, layer_h, old_e, self.max_slots
                ):
                    yield line
                self.raft_done = True

        yield None, b" TOWER START"

        self.log.debug(
            "Adding purge tower, z: {}, layer_h: {}".format(tower_z, layer_h)
        )

        initial_horizontal_dir = self.slots[self.slot]["horizontal_dir"]

        # handle retraction
        yield self._get_retraction(old_e)

        # handle z-hop
        z_hop = self._get_z_hop()
        if z_hop:
            yield z_hop

        y_pos = (self.wall_height + self.settings.extrusion_width) * self.slot
        if self.slots[self.slot]["horizontal_dir"] == self.E:
            x, y = gcode.get_coordinates_by_offsets(
                self.E,
                self.start_pos_x,
                self.start_pos_y,
                -0.5,
                self.settings.extrusion_width / 2 + y_pos,
            )
        else:
            x, y = gcode.get_coordinates_by_offsets(
                self.E,
                self.start_pos_x,
                self.start_pos_y,
                self.width - 0.5,
                -self.settings.extrusion_width / 2 + y_pos + self.height,
            )
        yield gcode.gen_head_move(
            x, y, self.settings.travel_xy_speed
        ), b" move to purge zone"

        self.slots[self.slot]["last_z"] = tower_z

        yield gcode.gen_z_move(tower_z, self.settings.travel_z_speed), b" move z close"
        self.current_z = tower_z

        yield gcode.gen_relative_positioning(), b" relative positioning"

        # turn linear advance off, if set
        if self.settings.linear_advance != 0:
            yield gcode.gen_lin_advance(0), b" turn off linear advance"

        # turn pressure advance off, if set
        if self.settings.pressure_advance:
            yield gcode.gen_pressure_advance(
                self.settings.pressure_advance[0], 0
            ), b" turn off pressure advance"

        new_temp = new_e.get_temperature(layer_nr)
        old_temp = self.temperatures.get(old_e.tool, old_e.get_temperature(layer_nr))
        self.temperatures[new_e.tool] = new_temp
        if new_temp == old_temp:
            new_temp = None

        # Pre-switch temp handling. Lower temp by setting value before purge
        temp_diff = self.settings.get_hw_config_float_value(
            "prepurge.temperature.change"
        )
        pre_temp = old_e.get_temperature(1) + temp_diff
        for line in self.get_temperature_gcode(pre_temp, old_e):
            yield line

        if self.g10 or self.tool_use_id:
            # set also new e temp since it needs to stay the same after filament change
            for line in self.get_temperature_gcode(
                pre_temp, new_e, wait=not utils.is_float_zero(temp_diff, 2)
            ):
                yield line

        yield self._get_prime(old_e)

        # pre-switch purge
        for line in self.get_pre_switch_gcode(old_e, new_e, layer_h):
            yield line

        if self.settings.get_hw_config_bool_value("tool.wait_on_change"):
            yield b"G4 S0", b" wait"

        yield gcode.gen_tool_change(new_e.tool), b" change tool"

        if self.settings.get_hw_config_bool_value("tool.reset_feed"):
            yield b"M220 S100", b" reset feedrate"

        if self.settings.get_hw_config_bool_value("tool.wait_on_change"):
            yield b"G4 S0", b" wait"

        # feed new filament
        for line in self.get_post_switch_gcode(new_e, layer_h):
            yield line

        # post-switch purge
        gap, purge_multiplier, lines = self._calculate_purge_values(layer_h, new_e)
        # switch direction depending of prepurge orientation
        gap_speed = self.settings.get_hw_config_float_value("prepurge.sweep.gap.speed")

        # e_len = 0
        speeds = self.generate_purge_speeds(self.settings.outer_perimeter_speed, lines)
        for i in range(len(speeds)):
            for _ in range(2):
                speed = speeds[i]
                if i == 0:
                    yield gcode.gen_direction_move(
                        self.slots[self.slot]["horizontal_dir"],
                        self.purge_line_width / 2,
                        self.settings.travel_xy_speed,
                        layer_h,
                    ), b" shift"
                else:
                    yield gcode.gen_direction_move(
                        self.slots[self.slot]["vertical_dir"], gap, gap_speed, layer_h
                    ), b" Y shift"
                yield gcode.gen_direction_move(
                    self.slots[self.slot]["horizontal_dir"],
                    self.purge_length,
                    speed,
                    layer_h,
                    extruder=new_e,
                    feed_multi=purge_multiplier,
                ), b" purge trail"
                self.slots[self.slot]["horizontal_dir"] = gcode.opposite_dir(
                    self.slots[self.slot]["horizontal_dir"]
                )

            if i == 1:
                if new_temp:
                    target_temp = new_temp
                else:
                    target_temp = old_temp
                # change nozzle temp after purging the old material.
                temp_change = abs(target_temp - old_temp)
                wait = temp_change > 15
                if wait:
                    # retract to minimize ooze during wait
                    yield new_e.get_retract_gcode()
                # change temp without wait
                for line in self.get_temperature_gcode(target_temp, new_e, wait=False):
                    yield line
                if wait:
                    # assume temp change of 1C per second and do some wipe movements during temp change
                    wipe_speed = self.purge_length * 2 / temp_change * 60
                    yield gcode.gen_direction_move(
                        self.slots[self.slot]["horizontal_dir"],
                        self.purge_length,
                        wipe_speed,
                        layer_h,
                    ), b" ooze wipe"
                    yield gcode.gen_direction_move(
                        gcode.opposite_dir(self.slots[self.slot]["horizontal_dir"]),
                        self.purge_length,
                        wipe_speed,
                        layer_h,
                    ), b" ooze wipe"
                    yield new_e.get_prime_gcode()

                # e_len += new_e.get_feed_length(self.purge_length, layer.height, feed_multi=purge_multiplier)

        # DEBUG
        # wall_e = new_e.get_feed_length((self.wall_width + self.wall_height) * 2, layer.height)
        # print("Purge E: {}".format(e_len + wall_e))

        # pressure equalization moves
        yield gcode.gen_direction_move(
            self.slots[self.slot]["horizontal_dir"],
            self.purge_length,
            self.settings.travel_xy_speed,
            layer_h,
        ), b" pressure equalization"
        yield gcode.gen_direction_move(
            gcode.opposite_dir(self.slots[self.slot]["horizontal_dir"]),
            self.purge_length,
            self.settings.travel_xy_speed,
            layer_h,
        ), b" pressure equalization"

        # move to purge zone wall start position
        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield self._get_wall_position_gcode(
            self.slots[self.slot]["horizontal_dir"],
            self.slots[self.slot]["vertical_dir"],
            1
        )
        yield gcode.gen_relative_positioning(), b" relative positioning"

        # turn linear advance back on, if set
        if self.settings.linear_advance != 0:
            yield gcode.gen_lin_advance(
                self.settings.linear_advance
            ), b" turn on linear advance"

        # turn pressure advance back on, if set
        if self.settings.pressure_advance:
            yield gcode.gen_pressure_advance(
                *self.settings.pressure_advance
            ), b" turn on pressure advance"

        # wall gcode
        for line in self._get_wall_gcode(
            new_e,
            layer_h,
            800,
            self.slots[self.slot]["horizontal_dir"],
            self.slots[self.slot]["vertical_dir"],
            1,
        ):
            yield line

        yield new_e.get_retract_gcode()
        self.e_pos = -new_e.retract
        if new_e.wipe:
            wipe_dir = gcode.opposite_dir(self.slots[self.slot]["vertical_dir"])
            yield gcode.gen_direction_move(
                wipe_dir, new_e.wipe, gap_speed, layer_h
            ), b" wipe"

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        yield gcode.gen_extruder_reset(), b" reset extruder position"

        # restore correct model z position
        self.current_z = layer_z
        yield self._get_z_hop()
        yield None, b" TOWER END"

        # readjust motor current
        motor_current = self.settings.get_hw_config_int_value("motor.current.run")
        if motor_current:
            yield gcode.gen_motor_current("E", motor_current), b" adjust current"

        # flip the directions
        self.slots[self.slot]["horizontal_dir"] = gcode.opposite_dir(
            initial_horizontal_dir
        )
        self.slots[self.slot]["vertical_dir"] = gcode.opposite_dir(
            self.slots[self.slot]["vertical_dir"]
        )

    def get_infill_lines_zigzag(self, layer_z, e_pos, extruder, slots):
        """
        G-code for switch tower infill
        :param layer_z: current layer z
        :param e_pos: extruder position
        :param extruder: active extruder
        :param slots: slot count
        :return: list of cmd, comment tuples
        """

        # TODO: move this to global state
        self.current_z = layer_z
        self.e_pos = e_pos

        # calculate layer height
        layer_h = round(self.current_z - self.slots[self.slot]["last_z"], 5)
        if layer_h <= 0.1:
            # no reason to print infill. Actually no reason to be here...
            return
        tower_z = round(layer_h + self.slots[self.slot]["last_z"], 5)

        self.log.debug(
            "Adding purge tower infill, z: {}, layer_h: {}".format(tower_z, layer_h)
        )
        yield None, b" TOWER INFILL START"

        # handle retraction
        yield self._get_retraction(extruder)

        # handle z-hop
        z_hop = self._get_z_hop()
        if z_hop:
            yield z_hop

        # update last_z for slots
        for s in range(slots):
            self.slots[self.slot + s]["last_z"] = tower_z

        # infill settings
        infill_x = (self.wall_width - 2) / len(self.infill_speeds)
        infill_y = (
            self.wall_height * slots
            + (slots - 1) * self.settings.extrusion_width
            - 0.3
        )
        infill_angle = math.degrees(math.atan(infill_y / infill_x))
        infill_path_length = gcode.calculate_path_length((0, 0), (infill_x, infill_y))

        flip = self.slots[self.slot]["flipflop_infill"]
        if flip:
            horizontal_dir = self.E
            vertical_dir = self.S

        else:
            horizontal_dir = self.W
            vertical_dir = self.N
            infill_angle = -infill_angle

        yield self._get_wall_position_gcode(horizontal_dir, vertical_dir, slots, infill=True)
        yield gcode.gen_z_move(tower_z, self.settings.travel_z_speed), b" move z close"
        self.current_z = tower_z
        yield gcode.gen_relative_positioning(), b" relative positioning"

        yield self._get_prime(extruder)

        # wall gcode
        for line in self._get_wall_gcode(
            extruder,
            layer_h,
            self.settings.default_speed,
            horizontal_dir,
            vertical_dir,
            slots,
            infill=True,
        ):
            yield line

        # infill 'lip' for better purge base
        yield gcode.gen_direction_move(
            horizontal_dir, 1, self.settings.travel_xy_speed, layer_h
        ), b" infill position"
        yield gcode.gen_direction_move(
            gcode.opposite_dir(vertical_dir),
            infill_y,
            self.settings.default_speed,
            layer_h,
            extruder=extruder,
            feed_multi=1.1,
        ), b" infill lip"

        for speed in self.infill_speeds:
            if flip:
                direction = horizontal_dir - infill_angle
            else:
                direction = horizontal_dir + 360 + infill_angle
            yield gcode.gen_direction_move(
                direction, infill_path_length, speed, layer_h, extruder=extruder, feed_multi=1.1
            ), b" infill"
            flip = not flip

        if len(self.infill_speeds) % 2:
            vertical_dir = gcode.opposite_dir(vertical_dir)

        yield gcode.gen_direction_move(
            vertical_dir,
            infill_y,
            self.infill_speeds[-1],
            layer_h,
            extruder=extruder,
            last_line=True,
        ), b" infill lip"

        yield extruder.get_retract_gcode()
        self.e_pos = -extruder.retract
        if extruder.wipe:
            yield gcode.gen_direction_move(
                gcode.opposite_dir(vertical_dir), extruder.wipe, 2000, layer_h
            ), b" wipe"

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        yield self._get_z_hop()
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        yield None, b" TOWER INFILL END"

        # flip the flop
        self.slots[self.slot]["flipflop_infill"] = not self.slots[self.slot][
            "flipflop_infill"
        ]

    def get_infill_lines_blocky(self, layer_z, e_pos, extruder, slots):
        """
        G-code for switch tower infill
        :param layer_z: current layer z
        :param e_pos: extruder position
        :param extruder: active extruder
        :param slots: slot count
        :return: list of cmd, comment tuples
        """

        # TODO: move this to global state
        self.current_z = layer_z
        self.e_pos = e_pos

        # calculate layer height
        layer_h = round(self.current_z - self.slots[self.slot]["last_z"], 5)
        if layer_h <= 0.1:
            # no reason to print infill. Actually no reason to be here...
            return
        tower_z = round(layer_h + self.slots[self.slot]["last_z"], 5)

        self.log.debug(
            "Adding purge tower infill, z: {}, layer_h: {}".format(tower_z, layer_h)
        )
        yield None, b" TOWER INFILL START"

        # handle retraction
        yield self._get_retraction(extruder)

        # handle z-hop
        z_hop = self._get_z_hop()
        if z_hop:
            yield z_hop

        # update last_z for slots
        for s in range(slots):
            self.slots[self.slot + s]["last_z"] = tower_z

        # infill settings
        infill_x = self.wall_width / len(self.infill_speeds)
        infill_y = (
            self.wall_height * slots
            + (slots - 1) * self.settings.extrusion_width
        )

        flip = self.slots[self.slot]["flipflop_infill"]
        if flip:
            horizontal_dir = self.E
        else:
            horizontal_dir = self.W
        vertical_dir = self.S

        yield self._get_wall_position_gcode(horizontal_dir, vertical_dir, slots, infill=True)
        yield gcode.gen_z_move(tower_z, self.settings.travel_z_speed), b" move z close"
        self.current_z = tower_z
        yield gcode.gen_relative_positioning(), b" relative positioning"

        yield self._get_prime(extruder)
        yield gcode.gen_direction_move(
            gcode.opposite_dir(vertical_dir),
            infill_y,
            self.settings.default_speed,
            layer_h,
            extruder=extruder,
            feed_multi=1.1,
        ), b" infill lip"

        for index, speed in enumerate(self.infill_speeds):
            yield gcode.gen_direction_move(
                horizontal_dir, infill_x, speed, layer_h, extruder=extruder
            ), b" infill"
            yield gcode.gen_direction_move(
                vertical_dir,
                infill_y,
                speed,
                layer_h,
                extruder=extruder,
                feed_multi=1.1,
                last_line=index == len(self.infill_speeds) - 1,
            ), b" infill"

            vertical_dir = gcode.opposite_dir(vertical_dir)

        yield extruder.get_retract_gcode()
        self.e_pos = -extruder.retract
        if extruder.wipe:
            yield gcode.gen_direction_move(
                vertical_dir, extruder.wipe, 2000, layer_h
            ), b" wipe"

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        yield self._get_z_hop()
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        yield None, b" TOWER INFILL END"

        # flip the flop
        self.slots[self.slot]["flipflop_infill"] = not self.slots[self.slot][
            "flipflop_infill"
        ]

    def get_thicc_lines(self, layer_z, e_pos, extruder, slots):
        """
        G-code for switch tower thicc infill, used to support the tool change layer
        :param layer_z: current layer z
        :param e_pos: extruder position
        :param extruder: active extruder
        :param slots: slot count
        :return: list of cmd, comment tuples
        """

        # TODO: move this to global state
        self.current_z = layer_z
        self.e_pos = e_pos

        # calculate layer height
        layer_h = round(self.current_z - self.slots[self.slot]["last_z"], 5)
        if layer_h <= 0.1:
            # no reason to print infill. Actually no reason to be here...
            return
        tower_z = round(layer_h + self.slots[self.slot]["last_z"], 5)

        self.log.debug(
            "Adding purge tower sparse infill, z: {}, layer_h: {}".format(tower_z, layer_h)
        )
        yield None, b" TOWER SPARSE INFILL START"

        # handle retraction
        yield self._get_retraction(extruder)

        # handle z-hop
        z_hop = self._get_z_hop()
        if z_hop:
            yield z_hop

        # update last_z for slots
        for s in range(slots):
            self.slots[self.slot + s]["last_z"] = tower_z

        # infill settings
        infill_y = (
            self.wall_height * slots
            + (slots - 1) * self.settings.extrusion_width
        )

        horizontal_dir = self.W
        vertical_dir = self.S

        yield self._get_wall_position_gcode(horizontal_dir, vertical_dir, slots, infill=True)
        yield gcode.gen_z_move(tower_z, self.settings.travel_z_speed), b" move z close"
        self.current_z = tower_z
        yield gcode.gen_relative_positioning(), b" relative positioning"

        yield self._get_prime(extruder)

        # wall gcode
        for line in self._get_wall_gcode(
            extruder,
            layer_h,
            self.settings.default_speed,
            horizontal_dir,
            vertical_dir,
            slots,
            infill=True,
        ):
            yield line

        yield gcode.gen_direction_move(
            vertical_dir, 0.3, 25 * 60, layer_h
        ), b" wall shift"


        lines = int((self.wall_width - 1))
        line_gap = (self.wall_width - 1) / lines

        for _ in range(lines):
            vertical_dir = gcode.opposite_dir(vertical_dir)
            yield gcode.gen_direction_move(
                horizontal_dir, line_gap, 25, layer_h, extruder=extruder, feed_multi=1
            ), b" infill"

            yield gcode.gen_direction_move(
                vertical_dir, infill_y, 25, layer_h, extruder=extruder, feed_multi=1.2
            ), b" infill"

        yield extruder.get_retract_gcode()
        self.e_pos = -extruder.retract
        if extruder.wipe:
            yield gcode.gen_direction_move(
                gcode.opposite_dir(vertical_dir), extruder.wipe, 2000, layer_h
            ), b" wipe"

        yield gcode.gen_absolute_positioning(), b" absolute positioning"
        yield gcode.gen_relative_e(), b" relative E"
        yield self._get_z_hop()
        yield gcode.gen_extruder_reset(), b" reset extruder position"
        yield None, b" TOWER SPARSE INFILL END"


    def check_infill(self, layer_z, e_pos, extruder):
        """
        Checks if tower z is too low versus layer and adds infill if needed
        :param layer_z: current layer z
        :param e_pos: extruder position
        :param extruder: active extruder
        :return: list of cmd, comment tuples
        """
        # TODO: rethink whole line thing. Maybe Writer object?

        if self.purge_handling == PURGE_HANDLING_BUCKET:
            return

        self.current_z = layer_z
        self.e_pos = e_pos

        # add brim if needed
        if not self.brim_done:
            for line in self.get_brim_lines(
                self.current_z, self.towers.max_layer_h, extruder
            ):
                yield line
            self.brim_done = True

        # find slots that need work
        count = 0
        thicc = 0
        zero_count = 0
        start_slot = -1
        for s in range(self.towers.get_tower_count(layer_z)):
            z = round(layer_z + self.settings.z_offset, 5)
            z_diff = round(z - self.slots[s]["last_z"], 5)
            if z_diff >= self.towers.get_min_layer_h() - 0.05:

                if start_slot == -1:
                    start_slot = s

                if self.slots[s]["last_z"] == 0:
                    zero_count += 1
                else:
                    if self.towers.get_tower_by_id(s).z[layer_z] == -2:
                        thicc += 1
                    else:
                        count += 1

        # empty slots, need raft
        if zero_count:
            if not self.raft_done:
                for line in self.get_raft_lines(
                    self.current_z, self.towers.max_layer_h, extruder, zero_count
                ):
                    yield line
                self.raft_done = True

        # slots needing infill

        if thicc:
            self.slot = start_slot
            for l in self.get_thicc_lines(layer_z, e_pos, extruder, thicc):
                yield l

        if count:
            self.slot = start_slot + thicc
            func = self.infill_functions[self.settings.infill_style]
            for l in func(layer_z, e_pos, extruder, count):
                yield l
