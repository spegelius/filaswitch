import types

from gcode import GCode

gcode = GCode()

ACT_SWITCH = 0
ACT_INFILL = 1
ACT_PASS = 2
ACTIONS = [ACT_SWITCH, ACT_INFILL, ACT_PASS]


class Layer:

    def __init__(self, num, z, height):
        self.num = num
        self.z = z
        self.lines = []
        self.height = height

        self.line_index = 0
        self.outer_perimeter_speed = None
        self.outer_perimeter_feedrate = None  # deprecated

        self.tool_change_count = 0
        self.action = ACT_PASS
        self.tower_slots = -1

    def add_line(self, cmd, comment=None):
        """
        Adds lines to line list
        :param cmd: g-code command or generator
        :param comment: comment
        :return: number of lines added
        """
        if isinstance(cmd, types.GeneratorType):
            lines = 0
            for c in cmd:
                if isinstance(c, tuple):
                    self.lines.append(c)
                else:
                    self.lines.append((c, comment))
                lines += 1
            return lines
        else:
            self.lines.append((cmd, comment))
            return 1

    def is_empty_layer(self):
        """
        Check if layer is empty, i.e. no commands
        :return: true or false
        """
        for cmd, _ in self.lines:
            if cmd:
                return False
        return True

    def insert_line(self, index, cmd, comment=None):
        """
        Insert line to given index position
        :param index: index
        :param cmd: g-code command or generator
        :param comment: g-code comment
        :return: number of lines inserted
        """
        if isinstance(cmd, types.GeneratorType):
            i = index
            lines = 0
            for c in cmd:
                if isinstance(c, tuple):
                    self.lines.insert(i, c)
                else:
                    self.lines.insert(i, (c, comment))
                i += 1
                lines += 1
            return lines
        else:
            self.lines.insert(index, (cmd, comment))
            return 1

    def replace_line(self, index, cmd, comment):
        """
        Replace line in given index position
        :param index: index
        :param cmd: g-code command
        :param comment: g-code comment
        :return: none
        """
        self.lines[index] = (cmd, comment)

    def has_tool_changes(self):
        """
        Check if layer has tool changes
        :return: true or false
        """
        for cmd, _ in self.lines:
            if cmd and gcode.is_tool_change(cmd) is not None:
                self.tool_change_count += 1
        return self.tool_change_count

    def delete_line(self, index=None):
        """
        Deletes line from line list
        :param index: index to delete
        :return:
        """
        if not index:
            l_index = self.line_index
        else:
            l_index = index
        self.lines.pop(l_index)

    def remove_comments(self):
        """ Removes comment lines """
        self.line_index = 0
        while True:
            try:
                if self.lines[self.line_index].startswith(b";"):
                    self.lines.pop(self.line_index)
                    continue
                self.lines[self.line_index] = self.lines[self.line_index].split(b";")[0].strip()
                self.line_index += 1
            except IndexError:
                return

    def read_lines(self):
        """
        Read lines, return also line index
        :return: list of line values (cmd, comment and index)
        """
        index = 0
        for line in self.lines:
            yield line[0], line[1], index
            index += 1

    def get_outer_perimeter_rates(self, search_comment=b"outer perimeter"):
        """
        Find outer perimeter print speed
        :return: perimeter print speed
        """

        if not self.outer_perimeter_speed:
            speeds = []
            feed_rates = []
            is_outer = False
            prev_position = None
            for cmd, comment in self.lines:
                if comment:
                    if search_comment in comment:
                        is_outer = True
                    else:
                        is_outer = False
                if cmd:
                    if is_outer:
                        position = None
                        if gcode.is_extrusion_move(cmd):
                            if gcode.last_match[3] > 0:
                                speeds.append(gcode.last_match[3])
                            position = gcode.last_match[0], gcode.last_match[1]
                        if prev_position and position:
                            length = gcode.calculate_path_length(prev_position, position)
                            _e_pos = gcode.last_match[3]
                            if _e_pos > 0 and length > 0.05:
                                feed_rate = gcode.calculate_feed_rate(length, _e_pos)
                                feed_rates.append(feed_rate)
                        if position:
                            prev_position = position
                    if gcode.is_head_move(cmd):
                        prev_position = (gcode.last_match[0], gcode.last_match[1])
            if speeds:
                self.outer_perimeter_speed = sum(speeds)/len(speeds)
                self.outer_perimeter_feedrate = sum(feed_rates)/len(feed_rates)

        return self.outer_perimeter_speed

    def __str__(self):
        return str(self.num)


class FirstLayer(Layer):

    def __init__(self, num, z, height):
        super().__init__(num, z, height)
        self.start_gcode_end = 0

    def get_outer_perimeter_rates(self, search_comment=b"outer perimeter"):
        values = super().get_outer_perimeter_rates()
        if not self.outer_perimeter_speed:
            values = super().get_outer_perimeter_rates(search_comment=b"skirt")
        return values

    def has_tool_changes(self):
        """
        Check if layer has tool changes
        :return: true or false
        """
        for cmd, _ in self.lines[self.start_gcode_end:]:
            if cmd and gcode.is_tool_change(cmd) is not None:
                self.tool_change_count += 1
        return self.tool_change_count
