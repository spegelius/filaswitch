import logging
import re
from extruder import Extruder
from gcode import GCode, TYPE_CARTESIAN, TYPE_DELTA
from layer import FirstLayer, ACT_INFILL, ACT_PASS, ACT_SWITCH, Layer

import utils
from gcode_file import GCodeFile
from settings import Settings

gcode = GCode()
log = logging.getLogger("PrusaSlic3r")


class PrusaSlic3rCodeFile(GCodeFile):

    slicer_type = GCodeFile.SLICER_PRUSA_SLIC3R

    LAYER_START_RE = re.compile(b"BEFORE_LAYER_CHANGE (\d+) (\d+\.*\d*)")
    VERSION_RE = re.compile(b".*(\d+)\.(\d+)\.(\d+).*")

    def __init__(self, logger, settings: Settings):
        super().__init__(logger, settings)

    def process(self, gcode_file):
        self.open_file(gcode_file)
        self.parse_version()
        self.parse_gcode()
        self.parse_header()

        if len(self.extruders.keys()) > 1:
            self.find_model_limits()
            self.add_tool_change_gcode()
        else:
            self.log.info(
                "No tool changes detected, skipping tool change g-code additions"
            )
        self.print_summary()
        return self.save_new_file()

    def parse_version(self):
        """
        Parse gcode file version
        :param lines: lines from gcode file
        :return:
        """
        for cmd, comment in self.lines:
            if comment is None:
                continue
            if (
                b" generated by Slic3r" in comment
                or b" generated by PrusaSlicer" in comment
            ):
                # parse version
                # ; generated by PrusaSlicer 2.1.0+win64 on 2019-10-01 at 15:29:03 UTC
                try:
                    m = self.VERSION_RE.match(comment)
                    self.version = (
                        int(m.groups()[0]),
                        int(m.groups()[1]),
                        int(m.groups()[2]),
                    )
                except Exception as e:
                    self.log.exception("Version parsing exception: %s" % e)
        if self.version is None:
            raise ValueError("Slic3r PE version cannot be parsed")

    @staticmethod
    def _parse_float_or_percentage(text, base_value):
        """
        Parse Prusa PE comment value that can be either float or percentage
        :param text: text to parse
        :param base_value: if percentage, calculate final value based on this
        :return:
        """
        if b"%" in text:
            percentage = float(text.split(b" = ")[1].strip(b"%"))
            return base_value / 100 * percentage
        else:
            return float(text.split(b" = ")[1])

    def parse_header(self):
        """
         Parse Prusa Slic3r header and stuff for print settings
        :return: none
        """

        # first parse values that are dependencies
        for cmd, comment in self.lines:
            if cmd:
                continue
            elif b" perimeter_speed =" in comment:
                # ; perimeter_speed = 40
                self.settings.default_speed = float(comment.split(b" = ")[1])

        z_offset = 0
        brim = -1
        for cmd, comment in self.lines:
            if cmd:
                continue
            if b" bed_shape =" in comment:
                # ; bed_shape = 0x0,145x0,145x148,0x148
                values = comment.split(b" = ")[1].split(b",")
                if len(values) == 4:
                    self.settings.machine_type = TYPE_CARTESIAN
                    self.settings.origin_offset_x = -float(values[0].split(b"x")[0])
                    self.settings.origin_offset_y = -float(values[0].split(b"x")[1])
                    self.settings.stroke_x = (
                        float(values[2].split(b"x")[0]) + self.settings.origin_offset_x
                    )
                    self.settings.stroke_y = (
                        float(values[2].split(b"x")[1]) + self.settings.origin_offset_y
                    )
                else:
                    self.settings.machine_type = TYPE_DELTA
                    x = []
                    y = []
                    for v in values:
                        vals = v.split(b"x")
                        x.append(float(vals[0]))
                        y.append(float(vals[1]))
                    self.settings.stroke_x = max(x) - min(x)
                    self.settings.stroke_y = max(y) - min(y)
                    self.settings.origin_offset_x = self.settings.stroke_x / 2
                    self.settings.origin_offset_y = self.settings.stroke_y / 2

            elif b" extrusion_multiplier =" in comment:
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b","):
                    if tool in self.extruders:
                        self.extruders[tool].feed_rate_multiplier = float(d)
                    tool += 1

            elif b" external_perimeter_extrusion_width" in comment:
                # ; external_perimeter_extrusion_width = 0.45
                try:
                    self.settings.extrusion_width = float(comment.split(b" = ")[1])
                except:
                    # don't fail if value is percentage
                    self.settings.extrusion_width = self.extruders[0].nozzle + 0.05

            # elif b"perimeters extrusion width" in comment:
            #     self.perimeter_widths.append(float(comment.split(b"=")[1:].strip()))
            # elif b"infill extrusion width" in comment:
            #     self.infill_widths.append(float(comment.split(b"=")[1:].strip()))
            # elif b"solid infill extrusion width" in comment:
            #     self.solid_infill_widths.append(float(comment.split(b"=")[1:].strip()))
            # elif b"top infill extrusion width" in comment:
            #     self.top_infill_widths.append(float(comment.split(b"=")[1:].strip()))

            elif b" filament_type =" in comment:
                # ; filament_type = PLA;PLA;PLA;PLA
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b";"):
                    if tool in self.extruders:
                        self.extruders[tool].filament_type = d
                    tool += 1

            elif b" retract_length =" in comment:
                # ; retract_length = 3,3,3,3
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b","):
                    if tool in self.extruders:
                        self.extruders[tool].retract = float(d)
                    tool += 1

            elif b" retract_lift =" in comment:
                # ; retract_lift = 0.5,0.5,0.5,0.5
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b","):
                    if tool in self.extruders:
                        self.extruders[tool].z_hop = float(d)
                    tool += 1

            elif b" retract_speed =" in comment:
                # ; retract_speed = 80,80,80,80
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b","):
                    if tool in self.extruders:
                        self.extruders[tool].retract_speed = float(d) * 60
                    tool += 1

            elif b" use_relative_e_distances =" in comment:
                # ; use_relative_e_distances = 1
                if comment.split(b" = ")[1] != b"1":
                    raise ValueError(
                        "Relative E distances not enabled! Filaswitch won't work without relative E distances"
                    )

            elif b" wipe = " in comment:
                # ; wipe = 1,1,1,1
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b","):
                    if tool in self.extruders:
                        if d == b"1":
                            self.extruders[
                                tool
                            ].wipe = 4  # TODO: figure a way to read wipe length
                    tool += 1

            elif b" external_perimeter_speed =" in comment:
                # ; external_perimeter_speed = 30
                self.settings.outer_perimeter_speed = self._parse_float_or_percentage(
                    comment, self.settings.default_speed
                )

            elif b" z_offset =" in comment:
                # ; z_offset = 0
                self.settings.z_offset = float(comment.split(b" = ")[1])

            elif b" first_layer_speed =" in comment:
                # ; first_layer_speed = 70%
                self.settings.first_layer_speed = self._parse_float_or_percentage(
                    comment, self.settings.default_speed
                )

            elif b" nozzle_diameter = " in comment:
                # ; nozzle_diameter = 0.4,0.4,0.4,0.4
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b","):
                    if tool in self.extruders:
                        self.extruders[tool].nozzle = float(d)
                    tool += 1

            elif b" travel_speed =" in comment:
                # ; travel_speed = 120
                self.settings.travel_xy_speed = float(comment.split(b" = ")[1])

            elif b" layer_height =" in comment:
                # ; layer_height = 0.2
                self.layer_height = float(comment.split(b" = ")[1])

            elif b" first_layer_temperature =" in comment:
                # ; first_layer_temperature = 215,195,215,215
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b","):
                    if tool in self.extruders:
                        self.extruders[tool].temperature_nr = tool
                        self.extruders[tool].temperature_setpoints[0] = int(d)
                    tool += 1

            elif b" temperature =" in comment:
                # ; temperature = 215,195,215,215
                values = comment.split(b" = ")[1]
                tool = 0
                for d in values.split(b","):
                    if tool in self.extruders:
                        self.extruders[tool].temperature_setpoints[1] = int(d)
                    tool += 1

            elif b" brim_width =" in comment:
                # ; brim_width = 3
                brim = int(comment.split(b" = ")[1])

        if not self.version:
            self.log.warning("Could not detect Slic3r version. Use at your own risk!")
        else:
            self.log.info("Slic3r version %d.%d.%d" % self.version)

        # final speeds
        self.settings.default_speed *= 60
        self.settings.first_layer_speed *= 60
        self.settings.outer_perimeter_speed *= 60
        self.settings.travel_xy_speed *= 60

        # use xy speed as z speed as there's no separate z speed value
        self.settings.travel_z_speed = self.settings.travel_xy_speed

        for t in self.extruders:
            self.extruders[t].z_offset = z_offset
            self.extruders[t].extrusion_width = self.settings.extrusion_width

        if self.settings.brim_auto and brim != -1:
            # Slic3r brim is in mm, convert to lines
            self.settings.brim = int(brim / self.settings.extrusion_width)


if __name__ == "__main__":
    import logger

    logger = logger.Logger(".")
    settings = Settings()
    s = PrusaSlic3rCodeFile(logger, settings)
