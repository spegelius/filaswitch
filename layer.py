from gcode import GCode

gcode = GCode()


class Layer:

    def __init__(self, num, z, height):
        self.num = num
        self.z = z
        self.lines = []
        self.height = height

        self.line_index = 0

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


class FirstLayer(Layer):

    def __init__(self, num, z, height):
        super().__init__(num, z, height)
        self.start_gcode_end = 0