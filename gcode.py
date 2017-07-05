import math
import re


class GCode:
    EXTRUDER_MOVE_RE = re.compile(b"^G1 E([-]*\d+\.\d+) F(\d+\.*\d*)$")
    Z_MOVE_RE = re.compile(b"^G1 Z([-]*\d+\.\d+) F(\d+\.*\d*)$")
    EXTRUSION_MOVE_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) E([-]*\d+\.\d+)")
    EXTRUSION_MOVE_SPEED_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) E([-]*\d+\.\d+) F(\d+\.*\d*)$")
    MOVE_HEAD_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) F(\d+\.*\d*)$")
    SPEED_RE = re.compile(b"^G1 F(\d+\.*\d*)$")
    EXTRUDER_POSITION_RE = re.compile(b"^G92 E0$")
    TOOL_RE = re.compile(b"T(\d)")

    def __init__(self):
        self.last_match = None

    def read_gcode_line(self, line):
        """
        Read given line and return it split to g-code and comment.
        :param line: g-code line
        :return: g-code, comment
        """
        if line.startswith(b";"):
            return None, line.split(b";", 1)[1].strip()
        values = line.strip().split(b";", 1)
        l = values[0].strip()
        if len(values) == 2:
            return l, values[1].strip()
        return l, None

    def format_to_string(self, cmd, comment):
        """
        Format given g-code command and optional comment to byte string
        :param cmd: command
        :param comment: comment
        :return: byte string
        """
        string = b""
        if cmd and not comment:
            return cmd
        elif comment and not cmd:
            return b"; " + comment
        else:
            return cmd + b"    ; " + comment

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
        rate = 1 / (path_len / extrusion_length)
        #rate = path_len / extrusion_length
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


if __name__ == "__main__":
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