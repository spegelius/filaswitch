import logging
import re

from gcode_file import SLICER_SIMPLIFY3D, GCodeFile
#from flavor_makerbot import MakerBotFlavor

log = logging.getLogger("Cubifier")


class Simplify3dGCodeFile(GCodeFile):

    slicer_type = SLICER_SIMPLIFY3D
    # Tune this to make filament flow fit your needs
    FLOW_MULTIPLIER = 0.365 # ok for MK8 drive gear

    def __init__(self, debug=False):
        super().__init__(debug=debug)
        self.extruder_diameters = []

    def process(self, gcode_file):
        super().process(gcode_file)
        return self.save_new_file()

    def parse_header(self):
        # Read temperature setting and replace it belowe Cube header
        self.line_index = 0

        header = False
        temp_line = None
        while True:
            try:
                l, comment = self.read_line()

                if comment:
                    if b"printMaterial" in comment:
                        self.material = comment.split(",")[-1]
                    elif b"extruderDiameter" in comment:
                        for d in comment.split(",", 1)[1:]:
                            self.extruder_diameters.append(float(d))
                    elif b"layer 1," in comment:
                        self.start_gcode_end = self.line_index

            except IndexError:
                break
            self.line_index += 1