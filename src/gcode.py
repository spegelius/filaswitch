import math
import re

import utils

E = 0
NE = E + 45
N = NE + 45
NW = N + 45
W = NW + 45
SW = W + 45
S = SW + 45
SE = S + 45

TYPE_CARTESIAN = 0
TYPE_DELTA = 1


class GCode:

    MOVE_RE = re.compile(b"^G0\s+|^G1\s+")
    X_COORD_RE = re.compile(b".*\s+X([-]*\d+\.*\d*)")
    Y_COORD_RE = re.compile(b".*\s+Y([-]*\d+\.*\d*)")
    E_COORD_RE = re.compile(b".*\s+E([-]*\d+\.*\d*)")
    Z_COORD_RE = re.compile(b".*\s+Z([-]*\d+\.*\d*)")

    SPEED_VAL_RE = re.compile(b".*\s+F(\d+\.*\d*)")

    #SPEED_RE = re.compile(b"^G1\s+F(\d+\.*\d*)$")

    EXTRUDER_POSITION_RE = re.compile(b"^G92\s+E0$")
    TOOL_RE = re.compile(b"T(\d)")
    RELATIVE_POSITIONING_RE = re.compile(b"^G91")
    ABSOLUTE_POSITIONING_RE = re.compile(b"^G90")
    TEMP_NOWAIT_RE = re.compile(b"M104\s+S(\d+)$")
    TEMP_NOWAIT_TOOL_RE = re.compile(b"M104\s+S(\d+)\s+T(\d)$")
    TEMP_WAIT_RE = re.compile(b"M109\s+S(\d+)$")
    TEMP_WAIT_TOOL_RE = re.compile(b"M109\s+S(\d+)\s+T(\d)$")
    LIN_ADVANCE_RE = re.compile(b"M900\s+K(\d+\.*\d*)")
    PRESSURE_ADVANCE_RE = re.compile(b"M572\s+D([:0-9]+)\s+S(\d.*\d+)")
    FAN_SPEED_RE = re.compile(b"M106\s+S(\d+)")

    def __init__(self):
        self.last_match = None

    @staticmethod
    def read_gcode_line(line):
        """
        Read given line and return it split to g-code and comment.
        :param line: g-code line
        :return: g-code, comment
        """
        if line.startswith(b";"):
            return None, line.split(b";", 1)[1]
        values = line.split(b";", 1)
        l = values[0]
        if len(values) == 2:
            return l, values[1]
        return l, None

    @staticmethod
    def format_to_string(cmd, comment):
        """
        Format given g-code command and optional comment to byte string
        :param cmd: command
        :param comment: comment
        :return: byte string
        """
        if cmd and not comment:
            return cmd
        elif comment is not None and not cmd:
            return b";" + comment
        else:
            return cmd + b";" + comment

    @staticmethod
    def calculate_path_length(prev_position, new_position):
        """ Calculate path length from given coordinates"""
        x_len = prev_position[0] - new_position[0]
        y_len = prev_position[1] - new_position[1]

        path_len = math.sqrt((x_len * x_len) + (y_len * y_len))
        return path_len

    @staticmethod
    def calculate_feed_rate(path_len, extrusion_length):
        """
        Calculate the feed rate for given path
        :param path_len: length of path
        :param extrusion_length: length of extrusion
        :return: feed rate (mm of filament/1 mm path)
        """
        if not path_len or not extrusion_length:
            return 0
        rate = extrusion_length / path_len
        return rate

    def is_tool_change(self, line):
        """
        Match given line against tool change regex
        :param line: g-code line
        :return: None or tool number
        """
        self.last_match = None
        m = self.TOOL_RE.match(line)
        if m:
            self.last_match = int(m.groups()[0])
        return self.last_match

    def is_extrusion_move(self, line):
        """
        Match given line against extrusion move regex
        :param line: g-code line
        :return: None or tuple with X, Y and E positions
        """
        self.last_match = None
        m = self._parse_move_args(line)
        if m and (m[0] is not None or m[1] is not None) and m[3] is not None and m[3] != 0:
            self.last_match = m
        return self.last_match

    def _parse_move_args(self, line):

        self.last_match = None
        m = self.MOVE_RE.match(line)
        if m:
            x = None
            y = None
            z = None
            e = None
            speed = None

            m = self.X_COORD_RE.match(line)
            if m:
                x = float(m.groups()[0])

            m = self.Y_COORD_RE.match(line)
            if m:
                y = float(m.groups()[0])

            m = self.Z_COORD_RE.match(line)
            if m:
                z = float(m.groups()[0])

            m = self.E_COORD_RE.match(line)
            if m:
                e = float(m.groups()[0])

            m = self.SPEED_VAL_RE.match(line)
            if m:
                speed = float(m.groups()[0])

            return x, y, z, e, speed

    def is_z_move(self, line):
        """
        Match given line against z move regex
        :param line: g-code line
        :return: None or z value
        """
        self.last_match = None
        m = self._parse_move_args(line)
        if m and m[0] is None and m[1] is None and m[2] is not None:
            self.last_match = (m[2], m[4])
        return self.last_match

    def is_extruder_move(self, line):
        """
        Match given line against extruder move regex
        :param line: g-code line
        :return: None or extruder position and speed
        """
        self.last_match = None
        m = self._parse_move_args(line)
        if m and m[0] is None and m[1] is None and m[2] is None and m[3] is not None:
            self.last_match = (m[3], m[4])
        return self.last_match

    def is_head_move(self, line):
        """
        Match given line against heade move regex
        :param line: g-code line
        :return: None or head position and speed
        """
        self.last_match = None
        m = self._parse_move_args(line)
        if m and (m[0] is not None or m[1] is not None) and (m[3] is None or m[3] == 0):
            self.last_match = (m[0], m[1], m[2], m[4])
        return self.last_match

    def is_relative_positioning(self, line):
        """
        Match given line against relative positioning regex
        :param line: g-code line
        :return: boolean
        """
        self.last_match = None
        m = self.RELATIVE_POSITIONING_RE.match(line)
        return m is not None

    def is_absolute_positioning(self, line):
        """
        Match given line against absolute positioning regex
        :param line: g-code line
        :return: boolean
        """
        self.last_match = None
        m = self.ABSOLUTE_POSITIONING_RE.match(line)
        return m is not None

    def is_temp_nowait(self, line):
        """
        Match given line against temperature change no wait regex
        :param line: g-code line
        :return: boolean
        """
        self.last_match = None
        m = self.TEMP_NOWAIT_RE.match(line)
        if m:
            self.last_match = (int(m.groups()[0]),)
        return self.last_match

    def is_temp_nowait_tool(self, line):
        """
        Match given line against temperature change no wait tool regex
        :param line: g-code line
        :return: boolean
        """
        self.last_match = None
        m = self.TEMP_NOWAIT_TOOL_RE.match(line)
        if m:
            self.last_match = int(m.groups()[0]), int(m.groups()[1])
        return self.last_match

    def is_temp_wait(self, line):
        """
        Match given line against temperature change wait regex
        :param line: g-code line
        :return: boolean
        """
        self.last_match = None
        m = self.TEMP_WAIT_RE.match(line)
        if m:
            self.last_match = (int(m.groups()[0]),)
        return self.last_match

    def is_temp_wait_tool(self, line):
        """
        Match given line against temperature change wait tool regex
        :param line: g-code line
        :return: boolean
        """
        self.last_match = None
        m = self.TEMP_WAIT_TOOL_RE.match(line)
        if m:
            self.last_match = int(m.groups()[0]), int(m.groups()[1])
        return self.last_match

    def is_lin_advance(self, line):
        """
        Match given line against linear advance regex
        :param line: g-code line
        :return: K value or none
        """
        self.last_match = None
        m = self.LIN_ADVANCE_RE.match(line)
        if m:
            self.last_match = float(m.groups()[0])
        return self.last_match

    def is_pressure_advance(self, line):
        """
        Match given line against pressure advance regex
        :param line: g-code line
        :return: D and S value tuple or None
        """
        self.last_match = None
        m = self.PRESSURE_ADVANCE_RE.match(line)
        if m:
            self.last_match = m.groups()[0], float(m.groups()[1])
        return self.last_match

    def is_fan_speed(self, line):
        """
        Match given line against fan speed regex
        :param line: g-code line
        :return: K value or none
        """
        self.last_match = None
        m = self.FAN_SPEED_RE.match(line)
        if m:
            self.last_match = int(m.groups()[0])
        return self.last_match

    @staticmethod
    def gen_lin_advance(k_val):
        """
        Generate linear advance K-value set gcode
        :param k_val: K value
        :return:
        """
        if type(k_val) == float:
            return ("M900 K%g" % k_val).encode()
        return ("M900 K%d" % k_val).encode()

    @staticmethod
    def gen_pressure_advance(d_val, s_val):
        """
        Generate pressure advance set gcode
        :param d_val: D value
        :param s_val: S value
        :return:
        """
        return b"M572 D%s S%.3f" % (d_val, s_val)

    @staticmethod
    def gen_fan_speed_gcode(speed):
        """
        Generate fan speed set gcode
        :param speed: speed value
        :return:
        """
        return ("M106 S%d" % speed).encode()

    @staticmethod
    def gen_fan_off_gcode():
        """
        Generate fan off gcode
        :return:
        """
        return b"M107"

    @staticmethod
    def gen_head_move(x, y, speed):
        """
        Generate g-code line for head move
        :param x: x coordinate
        :param y: y coordinate
        :param speed: movement speed
        :return: byte string
        """
        # handle zeroes... cannot omit 0-len axes
        if utils.is_float_zero(x, 3):
            return ("G1 X0 Y%.3f F%d" % (y, speed)).encode()
        elif utils.is_float_zero(y, 3):
            return ("G1 X%.3f Y0 F%d" % (x, speed)).encode()
        return ("G1 X%.3f Y%.3f F%d" % (x, y, speed)).encode()

    @staticmethod
    def gen_extrusion_move(x, y, e_length):
        """
        Generate g-code line for extrusion move. Relative distances
        :param x: x coordinate
        :param y: y coordinate
        :param e_length: extrusion length
        :return: byte string
        """
        # handle zeroes... cannot omit 0-len axes
        if utils.is_float_zero(x, 3):
            return ("G1 X0 Y%.3f E%.4f" % (y, e_length)).encode()
        elif utils.is_float_zero(y, 3):
            return ("G1 X%.3f Y0 E%.4f" % (x, e_length)).encode()
        return ("G1 X%.3f Y%.3f E%.4f" % (x, y, e_length)).encode()

    @staticmethod
    def gen_extrusion_speed_move(x, y, speed, e_length):
        """
        Generate g-code line for extrusion move with speed. Relative distances
        :param x: x coordinate
        :param y: y coordinate
        :param speed: movement speed
        :param e_length: extrusion length
        :return: byte string
        """
        # handle zeroes... cannot omit 0-len axes
        if utils.is_float_zero(x, 3):
            return ("G1 X0 Y%.3f E%.4f F%d" % (y, e_length, speed)).encode()
        elif utils.is_float_zero(y, 3):
            return ("G1 X%.3f Y0 E%.4f F%d" % (x, e_length, speed)).encode()
        return ("G1 X%.3f Y%.3f E%.4f F%d" % (x, y, e_length, speed)).encode()

    def gen_extrusion_e_speed_move(self, x, y, speed, move_length, e_length):
        """
        Generate g-code line for extrusion move with extruder speed. Relative distances
        :param x: x coordinate
        :param y: y coordinate
        :param speed: extruder speed
        :param move_length: length of move
        :param e_length: extrusion length
        :return: byte string
        """
        # handle zeroes... cannot omit 0-len axes
        e_time = abs(e_length) / (speed / 60)
        move_speed = move_length / e_time * 60
        # limit max speed
        if move_speed > speed:
            move_speed = speed
        return self.gen_extrusion_speed_move(x, y, move_speed, e_length)

    @staticmethod
    def gen_extruder_move(e_length, speed):
        """
        Generate g-code line for extruder move with given length and speed.
        :param e_length: extruder move length
        :param speed: move speed
        :return: byte string
        """
        return ("G1 E%.4f F%d" % (e_length, speed)).encode()

    @staticmethod
    def gen_z_move(z, speed):
        """
        Generate g-code line for z move with given z-position and speed.
        :param z: z position
        :param speed: move speed
        :return: byte string
        """
        return ("G1 Z%.4f F%d" % (z, speed)).encode()

    @staticmethod
    def gen_temperature_nowait(temperature):
        """
        Generate g-code line for temperature change with no wait.
        :param temperature: temperature to set
        :return: byte string
        """
        return ("M104 S%d" % temperature).encode()

    @staticmethod
    def gen_temperature_nowait_tool(temperature, tool, g10=False):
        """
        Generate g-code line for temperature change with no wait and specific tool.
        :param temperature: temperature to set
        :param tool: tool to use
        :return: byte string
        """
        if g10:
            return ("G10 P%d R%d S%d" % (tool, temperature, temperature)).encode()
        return ("M104 S%d T%d" % (temperature, tool)).encode()

    @staticmethod
    def gen_temperature_wait(temperature):
        """
        Generate g-code line for temperature change with wait.
        :param temperature: temperature to set
        :return: byte string
        """
        return ("M109 S%d" % temperature).encode()

    @staticmethod
    def gen_temperature_wait_tool(temperature, tool):
        """
        Generate g-code line for temperature change with wait and specific tool.
        :param temperature: temperature to set
        :param tool: tool to use
        :return: byte string
        """
        return ("M109 S%d T%d" % (temperature, tool)).encode()

    @staticmethod
    def gen_wait_all_temps():
        """
        Generate g-code line to wait for all tool temperatures.
        :param tool: tool to use
        :return: byte string
        """
        return b"M116"

    @staticmethod
    def gen_wait_tool_temp(tool):
        """
        Generate g-code line to wait for tool temperature.
        :return: byte string
        """
        return ("M116 P{}".format(tool)).encode()

    @staticmethod
    def gen_tool_change(tool):
        """
        Generate g-code line for tool change.
        :param tool: tool to use
        :return: byte string
        """
        return ("T%d" % tool).encode()

    @staticmethod
    def gen_motor_current(axis, current):
        """
        Send M907 to adjust motor current
        :param axis: the axis to adjust (usually E)
        :param current: motor current
        :return: byte string
        """
        return ("M907 %s%d" % (axis, current)).encode()

    @staticmethod
    def gen_absolute_positioning():
        """
        Generate g-code line for absolute positioning.
        :return: byte string
        """
        return b"G90"

    @staticmethod
    def gen_relative_positioning():
        """
        Generate g-code line for relative positioning.
        :return: byte string
        """
        return b"G91"

    @staticmethod
    def gen_pause(milliseconds):
        """
        Generate g-code line for pause.
        :param: milliseconds: pause length
        :return: byte string
        """
        return "G4 P{}".format(milliseconds).encode()

    @staticmethod
    def gen_extruder_reset():
        """
        Generate g-code line for extruder position reset.
        :return: byte string
        """
        return b"G92 E0"

    @staticmethod
    def gen_relative_e():
        """
        Generate g-code line for extruder relative mode
        :return: byte string
        """
        return b"M83"

    @staticmethod
    def _get_coordinates(direction, length):
        """
        Calculate coordinates from given direction and length. If coasting, calculate those coordinates too.
        Relative to 0,0
        :param direction:
        :param length:
        :param coasting:
        :return: tuple
        """
        angle = math.radians(direction)
        cosine = math.cos(angle)
        sine = math.sin(angle)
        x = cosine * length
        y = sine * length
        return x, y

    def gen_direction_move(self, direction, length, speed, layer_h,
                           extruder=None, feed_multi=1.0, e_length=None, last_line=False,
                           e_speed=False):
        """
        Generate g-code for head move to given direction. Relative distances
        :param direction: direction to move to (DIR_UP, DIR_DOWN, DIR_LEFT, DIR_RIGHT)
        :param length: move length
        :param speed: move speed
        :param layer_h: layer_height
        :param extruder: extruder object or None
        :param feed_multi: feed rate multiplier
        :param e_length: extrusion length override
        :param last_line: last line before move. Used only with extrusion moves
        :param e_speed: speed value is extruder speed
        :return:
        """
        if extruder and extruder.coasting and last_line:
            _length = abs(length) - extruder.coasting
            x, y = self._get_coordinates(direction, _length)
            c_x, c_y = self._get_coordinates(direction, extruder.coasting)
            e_length = extruder.get_feed_length(_length, layer_h, feed_multi=feed_multi)
            if e_speed:
                yield self.gen_extrusion_e_speed_move(x, y, speed, _length, e_length)
            else:
                yield self.gen_extrusion_speed_move(x, y, speed, e_length)
            yield self.gen_head_move(c_x, c_y, speed)
        else:
            _length = abs(length)
            x, y = self._get_coordinates(direction, _length)
            if not extruder:
                yield self.gen_head_move(x, y, speed)
            else:
                if not e_length:
                    e_length = extruder.get_feed_length(_length, layer_h, feed_multi=feed_multi)
                if e_speed:
                    yield self.gen_extrusion_e_speed_move(x, y, speed, _length, e_length)
                else:
                    yield self.gen_extrusion_speed_move(x, y, speed, e_length)

    def get_coordinates_by_offsets(self, direction, start_x, start_y, offset_x, offset_y):
        """
        Calculate new x-y coordinates by given direction and offsets
        :param direction: direction to go
        :param start_x: start position
        :param start_y: start position
        :param offset_x: offset x
        :param offset_y: offset y
        :return: tuple with new x-y coordinates
        """

        if start_x == 0 and start_y == 0:
            return start_x, start_y
        elif offset_x == 0:
            return start_x, start_y + offset_y
        elif offset_y == 0:
            return start_x + offset_x, start_y

        length = math.sqrt(offset_x ** 2 + offset_y ** 2)

        if offset_x < 0 <= offset_y:
            angle = math.atan(abs(offset_x) / abs(offset_y))
            new_angle = math.degrees(angle) + direction + 90
        elif offset_x < 0 and offset_y < 0:
            angle = math.atan(abs(offset_y) / abs(offset_x))
            new_angle = math.degrees(angle) + direction + 180
        elif offset_x >= 0 > offset_y:
            angle = math.atan(abs(offset_x) / abs(offset_y))
            new_angle = math.degrees(angle) + direction + 270
        else:
            angle = math.atan(abs(offset_y) / abs(offset_x))
            new_angle = math.degrees(angle) + direction

        x, y = self._get_coordinates(new_angle, length)
        return start_x + x, start_y + y

    def rotate(self, direction, rotation):
        """
        Calculate new rotated angle for give directory and rotation
        :param direction: current direction
        :param rotation: rotation angle
        :return: roated direction
        """
        new_dir = direction + rotation
        if new_dir >= 360:
            return new_dir - 360
        return new_dir

    def opposite_dir(self, direction):
        """
        Returns direction directly opposite to given direction
        :param direction: direction
        :return:
        """
        if direction >= 180:
            return direction - 180
        return direction + 180
