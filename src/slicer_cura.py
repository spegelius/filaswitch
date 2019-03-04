import logging
import re
from extruder import Extruder
from gcode import GCode, TYPE_CARTESIAN, TYPE_DELTA
from layer import FirstLayer, ACT_INFILL, ACT_PASS, ACT_SWITCH, Layer

import utils
from gcode_file import GCodeFile
from settings import Settings

gcode = GCode()
log = logging.getLogger("Cura")


class CuraGCodeFile(GCodeFile):

    slicer_type = GCodeFile.SLICER_CURA

    VERSION_RE = re.compile(b".*(\d+)\.(\d+)\.(\d+).*")

    def __init__(self, logger, settings: Settings):
        super().__init__(logger, settings)

    def process(self, gcode_file):
        self.open_file(gcode_file)
        self.parse_version()
        self.parse_gcode()
        if len(self.extruders.keys()) > 1:
            self.find_model_limits()
            self.add_tool_change_gcode()
        else:
            self.log.info("No tool changes detected, skipping tool change g-code additions")
        self.print_summary()
        return self.save_new_file()

    def parse_version(self):
        """
        Parse gcode file version
        :param lines: lines from gcode file
        :return:
        """
        for cmd, comment in self.lines:
            if comment and b"Generated with Cura_SteamEngine" in comment:
                # parse version
                try:
                    m = self.VERSION_RE.match(comment)
                    self.version = (int(m.groups()[0]), int(m.groups()[1]), int(m.groups()[2]))
                except Exception as e:
                    self.log.exception("Version parsing exception: %s" % e)
        if self.version is None:
            raise ValueError("Cura version cannot be parsed")
