from gcode import GCode

gcode = GCode()


class Layer:

    def __init__(self, num, z, height):
        self.num = num
        self.z = z
        self.lines = []
        self.height = height

        self.line_index = 0
        self.outer_perimeter_speed = None
        self.outer_perimeter_feedrate = None

    def add_line(self, cmd, comment):
        """
        Adds lines to line list
        :param cmd: g-code command
        :param comment: comment
        :return:
        """
        self.lines.append((cmd, comment))

    def is_empty_layer(self):
        """
        Check if layer is empty, i.e. no commands
        :return: true or false
        """
        for cmd, _ in self.lines:
            if cmd:
                return False
        return True

    def insert_line(self, index, cmd, comment):
        """
        Insert line to given index position
        :param index: index
        :param cmd: g-code command
        :param comment: g-code comment
        :return: none
        """
        self.lines.insert(index, (cmd, comment))

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
                return True
        return False

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

    def get_outer_perimeter_rates(self):
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
                    if b"outer perimeter" in comment:
                        is_outer = True
                    else:
                        is_outer = False
                if cmd:
                    if is_outer:
                        position = None
                        if gcode.is_extrusion_speed_move(cmd):
                            if gcode.last_match[2] > 0:
                                speeds.append(gcode.last_match[3])
                            position = gcode.last_match[0], gcode.last_match[1]
                        elif gcode.is_extrusion_move(cmd):
                            position = gcode.last_match[0], gcode.last_match[1]

                        if prev_position and position:
                            length = gcode.calculate_path_length(prev_position, position)
                            _e_pos = gcode.last_match[2]
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

        return self.outer_perimeter_speed, self.outer_perimeter_feedrate


class FirstLayer(Layer):

    def __init__(self, num, z, height):
        super().__init__(num, z, height)
        self.start_gcode_end = 0