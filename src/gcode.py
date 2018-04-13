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

    MOVE_RE = re.compile(b"^G1\s+")
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
    LIN_ADVANCE_RE = re.compile(b"M900\s+K(\d+)")

    def __init__(self):
        self.last_match = None

    def read_gcode_line(self, line):
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

    def format_to_string(self, cmd, comment):
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

    def calculate_path_length(self, prev_position, new_position):
        """ Calculate path length from given coordinates"""
        x_len = prev_position[0] - new_position[0]
        y_len = prev_position[1] - new_position[1]

        path_len = math.sqrt((x_len * x_len) + (y_len * y_len))
        return path_len

    def calculate_feed_rate(self, path_len, extrusion_length):
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
            self.last_match = int(m.groups()[0])
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
            self.last_match = int(m.groups()[0])
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
            self.last_match = int(m.groups()[0])
        return self.last_match

    def gen_lin_advance(self, k_val: int):
        """
        Generate linear advance K-value set gcode
        :param k_val: K value
        :return:
        """
        return ("M900 K%d" % k_val).encode()

    def gen_head_move(self, x, y, speed):
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

    def gen_extrusion_move(self, x, y, e_length):
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

    def gen_extrusion_speed_move(self, x, y, speed, e_length):
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

        e_time = e_length / (speed / 60)
        move_speed = move_length / e_time * 60
        # limit max speed
        if move_speed > speed:
            move_speed = speed
        return self.gen_extrusion_speed_move(x, y, move_speed, e_length)


    def gen_extruder_move(self, e_length, speed):
        """
        Generate g-code line for extruder move with given length and speed.
        :param e_length: extruder move length
        :param speed: move speed
        :return: byte string
        """
        return ("G1 E%.4f F%d" % (e_length, speed)).encode()

    def gen_z_move(self, z, speed):
        """
        Generate g-code line for z move with given z-position and speed.
        :param z: z position
        :param speed: move speed
        :return: byte string
        """
        return ("G1 Z%.4f F%d" % (z, speed)).encode()

    def gen_temperature_nowait(self, temperature):
        """
        Generate g-code line for temperature change with no wait.
        :param temperature: temperature to set
        :return: byte string
        """
        return ("M104 S%d" % temperature).encode()

    def gen_temperature_nowait_tool(self, temperature, tool):
        """
        Generate g-code line for temperature change with no wait and specific tool.
        :param temperature: temperature to set
        :param tool: tool to use
        :return: byte string
        """
        return ("M104 S%d T%d" % (temperature, tool)).encode()

    def gen_temperature_wait(self, temperature):
        """
        Generate g-code line for temperature change with wait.
        :param temperature: temperature to set
        :return: byte string
        """
        return ("M109 S%d" % temperature).encode()

    def gen_temperature_wait_tool(self, temperature, tool):
        """
        Generate g-code line for temperature change with wait and specific tool.
        :param temperature: temperature to set
        :param tool: tool to use
        :return: byte string
        """
        return ("M109 S%d T%d" % (temperature, tool)).encode()

    def gen_tool_change(self, tool):
        """
        Generate g-code line for tool change.
        :param tool: tool to use
        :return: byte string
        """
        return ("T%d" % tool).encode()
        
    def gen_motor_current(self, axis, current):
        """
        Send M907 to adjust motor current
        :param axis: the axis to adjust (usually E)
        :param current: motor current
        :return: byte string
        """
        return ("M907 %s%d" % (axis, current)).encode()

    def gen_absolute_positioning(self):
        """
        Generate g-code line for absolute positioning.
        :return: byte string
        """
        return b"G90"

    def gen_relative_positioning(self):
        """
        Generate g-code line for relative positioning.
        :return: byte string
        """
        return b"G91"

    def gen_pause(self, milliseconds):
        """
        Generate g-code line for pause.
        :param: milliseconds: pause length
        :return: byte string
        """
        return "G4 P{}".format(milliseconds).encode()

    def gen_extruder_reset(self):
        """
        Generate g-code line for extruder position reset.
        :return: byte string
        """
        return b"G92 E0"

    def gen_relative_e(self):
        """
        Generate g-code line for extruder relative mode
        :return: byte string
        """
        return b"M83"

    def _get_coordinates(self, direction, length):
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
                yield self.gen_extrusion_e_speed_move(x, y, speed, e_length)
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


if __name__ == "__main__":
    # test stuff
    obj = GCode()
    print("\n*** Extruder move")
    print(obj.is_extruder_move(b"G1 E-2.5 F1500"))
    print(obj.is_extruder_move(b"G1 E-2.5"))
    print(obj.is_extruder_move(b'G1 E-3.00000 F4800.00000'))

    print("\n*** Read gcode line")
    print(obj.read_gcode_line(b"G1 E5 F1500  ; juu"))
    print(obj.read_gcode_line(b"; juu"))
    print(obj.read_gcode_line(b"; juu ; joo"))
    print(obj.read_gcode_line(b"G1 E-3.00000 F4800.00000"))

    print("\n*** Z move")
    print(obj.is_z_move(b"G1 Z5.500 F1500"))
    print(obj.is_z_move(b"G1 Z5.500"))

    print("\n*** Tool change")
    print(obj.is_tool_change(b"T0"))
    print(obj.is_tool_change(b"T1"))

    print("\n*** Extrusion move")
    print(obj.is_extrusion_move(b"G1 X80.349 Y81.849 E-2.5000"))
    print(obj.is_extrusion_move(b"G1 X80.349 Y81.849 E0"))
    print(obj.is_extrusion_move(b"G1 X80.349 Y81.849 E5 F2000"))

    print("\n*** Head move")
    print(obj.is_head_move(b"G1 X65.82 Y76.532 Z5.7 E0 F1500"))
    print(obj.is_head_move(b"G1 X65.82 Y76.532 F1500"))
    print(obj.is_head_move(b"G1 Y76.532 F1500"))
    print(obj.is_head_move(b"G1 X65.82 F1500"))

    print("\n*** Direction move")
    ret = obj.gen_direction_move(E, 40, 3000, 0.1)
    for r in ret:
        print(r)
    import extruder
    e = extruder.Extruder(0)
    e.coasting = 0.2
    ret = obj.gen_direction_move(W, 40, 3000, 0.2, e)
    for r in ret:
        print(r)
    ret = obj.gen_direction_move(S, 40, 3000, 0.1, e, last_line=True)
    for r in ret:
        print(r)

    print("\n*** Get coordinates")
    print(obj._get_coordinates(N, 10))
    print(obj._get_coordinates(NE, 10))
    print(obj._get_coordinates(E, 10))
    print(obj._get_coordinates(SE, 10))
    print(obj._get_coordinates(S, 10))
    print(obj._get_coordinates(SW, 10))
    print(obj._get_coordinates(W, 10))
    print(obj._get_coordinates(NW, 10))

    print(obj._get_coordinates(30, 10))
    print(obj._get_coordinates(80, 10))

    print(obj._get_coordinates(100, 10))

    print(obj._get_coordinates(200, 10))

    print(obj._get_coordinates(346, 10))

    print("\n*** Get coordinates by offsets")
    print(obj.get_coordinates_by_offsets(0, 10, 10, 1, 15))
    print(obj.get_coordinates_by_offsets(1, 10, 10, 1, 15))
    print(obj.get_coordinates_by_offsets(0, 10, 10, -3, 15))
    print(obj.get_coordinates_by_offsets(10, 10, 10, -3, 15))
    print(obj.get_coordinates_by_offsets(10, 10, 10, 2, 1))
    print(obj.get_coordinates_by_offsets(10, 10, 10, -4, -2))
    print(obj.get_coordinates_by_offsets(10, 10, 10, -2, -4))

    print(obj.get_coordinates_by_offsets(10, 10, 10, 2, -4))

    print(obj.is_temp_nowait(b"M104 S255"))
    print(obj.is_temp_nowait_tool(b"M104 S255  T0"))

    print(obj.is_temp_wait(b"M109 S255"))
    print(obj.is_temp_wait_tool(b"M109 S255 T0"))

    print(obj.opposite_dir(E))
    print(obj.opposite_dir(W))
    print(obj.opposite_dir(S))
    print(obj.opposite_dir(N))

    print(obj.opposite_dir(E+270))
    print(obj.opposite_dir(W+270))
    print(obj.opposite_dir(S+270))
    print(obj.opposite_dir(N+270))

    print(obj.rotate(W, 270))