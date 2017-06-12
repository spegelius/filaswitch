import logging
import re
from extruder import Extruder

from gcode_file import SLICER_SIMPLIFY3D, GCodeFile
#from flavor_makerbot import MakerBotFlavor

log = logging.getLogger("Cubifier")


class Simplify3dGCodeFile(GCodeFile):

    slicer_type = SLICER_SIMPLIFY3D
    # Tune this to make filament flow fit your needs
    FLOW_MULTIPLIER = 0.365 # ok for MK8 drive gear

    def __init__(self, debug=False):
        super().__init__(debug=debug)
        self.extruder_diameter = []
        self.extruder_use_retract = []
        self.extruder_retract_dist = []

    def process(self, gcode_file):
        super().process(gcode_file)
        return self.save_new_file()

    def get_extruders(self):
        for i in range(len(self.extruder_diameter)):
            self.extruders.append(Extruder(i, self.extruder_diameter[i], self.extruder_retract_dist[i]))

    def parse_header(self):
        # Read temperature setting and replace it belowe Cube header
        super().parse_header()
        self.line_index = 0

        while True:
            try:
                l, comment = self.read_line()

                if not l.startswith(b";"):
                    pass
                elif b"printMaterial" in l:
                    self.material = l.split(b",")[-1]
                elif b"extruderDiameter" in l:
                    for d in l.split(b",")[1:]:
                        self.extruder_diameter.append(float(d))
                elif b"extruderUseRetract" in l:
                    for d in l.split(b",")[1:]:
                        self.extruder_use_retract.append(d == b"1")
                elif b"extruderRetractionDistance" in l:
                    for d in l.split(b",")[1:]:
                        self.extruder_retract_dist.append(float(d))
            except IndexError:
                break
            self.line_index += 1