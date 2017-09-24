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
    EXTRUDER_MOVE_RE = re.compile(b"^G1 E([-]*\d+\.\d+) F(\d+\.*\d*)$")
    Z_MOVE_RE = re.compile(b"^G1 Z([-]*\d+\.\d+) F(\d+\.*\d*)$")
    EXTRUSION_MOVE_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) E([-]*\d+\.\d+)$")
    EXTRUSION_MOVE_SPEED_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) E([-]*\d+\.\d+) F(\d+\.*\d*)$")
    MOVE_HEAD_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) F(\d+\.*\d*)$")
    SPEED_RE = re.compile(b"^G1 F(\d+\.*\d*)$")
    EXTRUDER_POSITION_RE = re.compile(b"^G92 E0$")
    TOOL_RE = re.compile(b"T(\d)")
    RELATIVE_POSITIONING_RE = re.compile(b"^G91")
    ABSOLUTE_POSITIONING_RE = re.compile(b"^G90")

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
        m = self.EXTRUSION_MOVE_RE.match(line)
        if m:
            g = m.groups()
            self.last_match = float(g[0]), float(g[1]), float(g[2])
        return self.last_match

    def is_extrusion_speed_move(self, line):
        """
        Match given line against extrusion speed move regex
        :param line: g-code line
        :return: None or tuple with X, Y, E positions and speed
        """
        self.last_match = None
        m = self.EXTRUSION_MOVE_SPEED_RE.match(line)
        if m:
            g = m.groups()
            self.last_match = float(g[0]), float(g[1]), float(g[2]), float(g[3])
        return self.last_match

    def is_z_move(self, line):
        """
        Match given line against z move regex
        :param line: g-code line
        :return: None or z value
        """
        self.last_match = None
        m = self.Z_MOVE_RE.match(line)
        if m:
            self.last_match = float(m.groups()[0]), float(m.groups()[1])
        return self.last_match

    def is_extruder_move(self, line):
        """
        Match given line against extruder move regex
        :param line: g-code line
        :return: None or extruder position and speed
        """
        self.last_match = None
        m = self.EXTRUDER_MOVE_RE.match(line)
        if m:
            self.last_match = float(m.groups()[0]), float(m.groups()[1])
        return self.last_match

    def is_head_move(self, line):
        """
        Match given line against heade move regex
        :param line: g-code line
        :return: None or head position and speed
        """
        self.last_match = None
        m = self.MOVE_HEAD_RE.match(line)
        if m:
            self.last_match = float(m.groups()[0]), float(m.groups()[1]), float(m.groups()[2])
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

    def gen_head_move(self, x, y, speed):
        """
        Generate g-code line for head move
        :param x: x coordinate
        :param y: y coordinate
        :param speed: movement speed
        :return: byte string
        """
        if utils.is_float_zero(x, 3):
            return ("G1 Y%.3f F%d" % (y, speed)).encode()
        elif utils.is_float_zero(y, 3):
            return ("G1 X%.3f F%d" % (x, speed)).encode()
        return ("G1 X%.3f Y%.3f F%d" % (x, y, speed)).encode()

    def gen_extrusion_move(self, x, y, e_length):
        """
        Generate g-code line for extrusion move. Relative distances
        :param x: x coordinate
        :param y: y coordinate
        :param e_length: extrusion length
        :return: byte string
        """
        if utils.is_float_zero(x, 3):
            return ("G1 Y%.3f E%.4f" % (y, e_length)).encode()
        elif utils.is_float_zero(y, 3):
            return ("G1 X%.3f E%.4f" % (x, e_length)).encode()
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
        if utils.is_float_zero(x, 3):
            return ("G1 Y%.3f E%.4f F%d" % (y, e_length, speed)).encode()
        elif utils.is_float_zero(y, 3):
            return ("G1 X%.3f E%.4f F%d" % (x, e_length, speed)).encode()
        return ("G1 X%.3f Y%.3f E%.4f F%d" % (x, y, e_length, speed)).encode()

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

    def gen_direction_move(self, direction, length, speed, extruder=None, feed_rate=None, last_line=False):
        """
        Generate g-code for head move to given direction. Relative distances
        :param direction: direction to move to (DIR_UP, DIR_DOWN, DIR_LEFT, DIR_RIGHT)
        :param length: move length
        :param speed: move speed
        :param extruder: extruder object or None
        :param feed_rate: feed rate override
        :param last_line: last line before move. Used only with extrusion moves
        :return:
        """
        if extruder and extruder.coasting and last_line:
            _length = abs(length) - extruder.coasting
            x, y = self._get_coordinates(direction, _length)
            c_x, c_y = self._get_coordinates(direction, extruder.coasting)
            e_length = extruder.get_feed_length(_length, feed_rate=feed_rate)
            yield self.gen_extrusion_speed_move(x, y, speed, e_length)
            yield self.gen_head_move(c_x, c_y, speed)
        else:
            _length = abs(length)
            x, y = self._get_coordinates(direction, _length)
            if not extruder:
                yield self.gen_head_move(x, y, speed)
            else:
                e_length = extruder.get_feed_length(_length, feed_rate=feed_rate)
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
        length = math.sqrt(offset_x ** 2 + offset_y ** 2)

        if offset_x < 0 and offset_y >= 0:
            angle = math.atan(abs(offset_x) / abs(offset_y))
            new_angle = math.degrees(angle) + direction + 90
        elif offset_x < 0 and offset_y < 0:
            angle = math.atan(abs(offset_y) / abs(offset_x))
            new_angle = math.degrees(angle) + direction + 180
        elif offset_x >= 0 and offset_y < 0:
            angle = math.atan(abs(offset_x) / abs(offset_y))
            new_angle = math.degrees(angle) + direction + 270
        else:
            angle = math.atan(abs(offset_y) / abs(offset_x))
            new_angle = math.degrees(angle) + direction

        x, y = self._get_coordinates(new_angle, length)
        return start_x + x, start_y + y

if __name__ == "__main__":
    # test stuff
    obj = GCode()
    print(obj.is_extruder_move(b"G1 E-2.5 F1500"))
    print(obj.read_gcode_line(b"G1 E5 F1500  ; juu"))
    print(obj.read_gcode_line(b"; juu"))
    print(obj.read_gcode_line(b"; juu ; joo"))
    print(obj.is_z_move(b"G1 Z5.500 F1500"))
    print(obj.is_tool_change(b"T0"))
    print(obj.is_tool_change(b"T1"))
    print(obj.is_extrusion_move(b"G1 X80.349 Y81.849 E-2.5000"))
    print(obj.is_extrusion_speed_move(b"G1 X80.349 Y81.849 E-2.5000 F3000"))
    print(obj.read_gcode_line(b"G1 E-3.00000 F4800.00000"))
    print(obj.is_extruder_move(b'G1 E-3.00000 F4800.00000'))
    ret = obj.gen_direction_move(E, 40, 3000)
    for r in ret:
        print(r)
    import extruder
    e = extruder.Extruder(0)
    e.coasting = 0.2
    ret = obj.gen_direction_move(W, 40, 3000, e, feed_rate=0.05)
    for r in ret:
        print(r)
    ret = obj.gen_direction_move(S, 40, 3000, e, feed_rate=0.05, last_line=True)
    for r in ret:
        print(r)

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

    print("------------------------")
    print(obj.get_coordinates_by_offsets(0, 10, 10, 1, 15))
    print(obj.get_coordinates_by_offsets(1, 10, 10, 1, 15))
    print(obj.get_coordinates_by_offsets(0, 10, 10, -3, 15))
    print(obj.get_coordinates_by_offsets(10, 10, 10, -3, 15))
    print(obj.get_coordinates_by_offsets(10, 10, 10, 2, 1))
    print(obj.get_coordinates_by_offsets(10, 10, 10, -4, -2))
    print(obj.get_coordinates_by_offsets(10, 10, 10, -2, -4))

    print(obj.get_coordinates_by_offsets(10, 10, 10, 2, -4))