import logging
import re
from extruder import Extruder

from gcode import GCode


import utils
from gcode_file import SLICER_SIMPLIFY3D, GCodeFile
#from flavor_makerbot import MakerBotFlavor

gcode = GCode()
log = logging.getLogger("S3DSlicer")


class Simplify3dGCodeFile(GCodeFile):

    slicer_type = SLICER_SIMPLIFY3D

    LAYER_START_RE = re.compile(b"layer (\d+), Z = (\d+\.*\d*)")

    def __init__(self, debug=False):
        super().__init__(debug=debug)
        self.extruder_diameter = []
        self.extruder_use_retract = []
        self.extruder_retract_dist = []
        self.extruder_retract_speed = []
        self.extruder_zhop = []

    def process(self, gcode_file):
        super().process(gcode_file)
        return self.save_new_file()

    def get_extruders(self):
        """
        Populate extruder list
        :return:
        """
        for i in range(len(self.extruder_diameter)):
            self.extruders[i] = Extruder(i, self.extruder_diameter[i],
                                         self.extruder_retract_dist[i],
                                         self.extruder_retract_speed[i],
                                         self.extruder_zhop[i])

    def parse_header(self):
        """ Parse S3D header for print settings """

        for cmd, comment, line_index in self.layers[0].lines:

            if not comment:
                pass
            elif b"printMaterial" in comment:
                self.material = comment.split(b",")[-1]
            elif b"extruderDiameter" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_diameter.append(float(d))
            elif b"extruderUseRetract" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_use_retract.append(d == b"1")
            elif b"extruderRetractionDistance" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_retract_dist.append(float(d))
            elif b"extruderRetractionZLift" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_zhop.append(float(d))
            elif b"layerHeight" in comment:
                self.layer_height = float(comment.split(b",")[1])
            elif b"extruderRetractionSpeed" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_retract_speed.append(float(d))

    def parse_print_settings(self):
        """ S3D specific settings """

        super().parse_print_settings()

        for cmd, comment, line_index in self.layers[0].lines:
            # find first tool change and remove it if it's T0. No need to
            # do tool change as e already have T0 active
            if cmd and gcode.is_tool_change(cmd) == 0:
                self.layers[0].delete_line(line_index)

    def check_layer_change(self, line, current_layer):
        """
        Check if line is layer change
        :param line: g-code line
        :param current_layer: current layer data
        :return: None or tuple of layer nr and layer z
        """
        m = self.LAYER_START_RE.match(line)
        if m:
            return int(m.groups()[0]), float(m.groups()[1])
        return current_layer

    def find_perimeter_path(self):
        """ Find perimeter path for determining feed rate"""
        pass
        # TODO: needed?


if __name__ == "__main__":
    s = Simplify3dGCodeFile(True)
    print(s.check_layer_change(b"; layer 1, Z = 1", None))