import logging
import re
from extruder import Extruder
from switch_tower import PEEK
from gcode import GCode


import utils
from gcode_file import SLICER_SIMPLIFY3D, GCodeFile
#from flavor_makerbot import MakerBotFlavor

gcode = GCode()
log = logging.getLogger("S3DSlicer")


class Simplify3dGCodeFile(GCodeFile):

    slicer_type = SLICER_SIMPLIFY3D

    LAYER_START_RE = re.compile(b".*layer (\d+), Z = (\d+\.*\d*)")
    VERSION_RE = re.compile(b".*Version (\d)\.(\d)\.(\d)")

    def __init__(self, logger, hw_config):
        super().__init__(logger, hw_config)
        self.extruder_diameter = []
        self.extruder_use_retract = []
        self.extruder_retract_dist = []
        self.extruder_retract_speed = []
        self.extruder_zhop = []
        self.relative_e = False
        self.retract_while_wiping = False
        self.version = None

        self.default_speed = None

    def process(self, gcode_file):
        self.open_file(gcode_file)
        self.parse_header()
        self.get_extruders()
        self.parse_print_settings()
        self.fix_retract_during_wipe()
        if len(self.tools) > 1:
            self.find_tower_position()
            self.add_switch_raft()
            self.add_tool_change_gcode()
        else:
            self.log.info("No tool changes detected, skipping tool change g-code additions")
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
        """
         Parse S3D header for print settings
        :return: none
        """

        for cmd, comment in self.layers[0].lines:

            if not comment:
                pass
            elif b"Simplify3D(R)" in comment:
                # parse version
                try:
                    m = self.VERSION_RE.match(comment)
                    self.version = (int(m.groups()[0]), int(m.groups()[1]), int(m.groups()[2]))
                except Exception as e:
                    print(e)
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
            elif b"relativeEdistances" in comment:
                self.relative_e = comment.split(b",")[-1] == b"1"
            elif b"retractWhileWiping" in comment:
                self.retract_while_wiping = comment.split(b",")[-1] == b"1"
            elif b"defaultSpeed" in comment:
                self.default_speed = int(comment.split(b",")[-1])
            elif b"rapidXYspeed" in comment:
                self.travel_xy_speed = int(comment.split(b",")[-1])
            elif b"rapidZspeed" in comment:
                self.travel_z_speed = int(comment.split(b",")[-1])
            elif b"outlineUnderspeed" in comment:
                self.outer_perimeter_speed = float(comment.split(b",")[-1])
            elif b"solidInfillUnderspeed" in comment:
                self.infill_speed = float(comment.split(b",")[-1])
            elif b"supportUnderspeed" in comment:
                self.support_speed = float(comment.split(b",")[-1])

        if not self.relative_e:
            raise ValueError("Relative E distances not enabled! Filaswitch won't work without relative E distances")
        if not self.version:
            self.log.warning("Could not detect Simplify3D version. Use at your own risk")
        else:
            self.log.info("Simplify3D version %d.%d.%d" % self.version)

        self.outer_perimeter_speed *= self.default_speed

    def parse_print_settings(self):
        """ S3D specific settings """

        super().parse_print_settings()

        for cmd, comment, line_index in self.layers[0].read_lines():
            # find first tool change and remove it if it's T0. No need to
            # do tool change as e already have T0 active
            if cmd and gcode.is_tool_change(cmd) == 0:
                self.layers[0].delete_line(line_index)
                break

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

    def filter_layers(self, last_switch_height):
        """
        Filter layers so that only layers needed for purge tower processing
        are returned.
        Layers that are left out:
        - empty (no command lines)
        - non-tool
        :param last_switch_height: z height of last switch layer
        :return: tuple of layer, tower_needed, has_tool_change
        """
        layers = []
        z_positions = []

        # step 1: filter out empty layers and add z_positions to array
        for layer in self.layers:
            if layer.z > last_switch_height:
                break
            if layer.is_empty_layer():
                continue
            if layer.z not in z_positions:
                z_positions.append(layer.z)
            layers.append(layer)

        # step 2: go through the z position list and store layers with info if infill is needed for the layer
        z_groups = []
        for z in z_positions:
            z_group = []
            z_layers = []
            tower_z_ok = False
            for l in layers:
                if l.z == z:
                    z_layers.append(l)

            # first check tool change layers
            for l in z_layers:
                if l.has_tool_changes():
                    tower_z_ok= True
                    z_group.append((l, True, True))

            # then check other layers, only after tower_z_ok is prepared
            for l in z_layers:
                if not l.has_tool_changes():
                    if not tower_z_ok:
                        tower_z_ok = True
                        z_group.append((l, True, False))
                    else:
                        z_group.append((l, False, False))
            z_groups.append(z_group)

        # step 3: pack groups to list
        layers = []
        for z_group in z_groups:
            for l, needed, has_tool in z_group:
                #print(l.z, needed, has_tool)
                layers.append((l, needed, has_tool))
        layers = sorted(layers, key=lambda x: x[0].num)
        return layers

    def fix_retract_during_wipe(self):
        """
        Fix S3D 3.1.1 bug where option "Retract during wipe" causes over-extrusion
        :return: none
        """
        if not self.retract_while_wiping:
            # not needed
            return
        if not self.version == (3,1,1):
            self.log.warning("Not applying fix for 'Retract during wipe'; S3D version not 3.1.1")
            return

        self.log.info("Fixing S3D 3.1.1 bug with 'Retract during wipe'-feature")

        wipe_on = False
        wipe_indexes = []
        wipe_layer = None
        last_move_speed = None
        extruder = self.extruders[0]

        for layer in self.layers:

            for cmd, comment, index in layer.read_lines():
                if not cmd:
                    continue
                if gcode.is_extrusion_speed_move(cmd):
                    # detect retract/wipe
                    if gcode.last_match[2] < 0:
                        wipe_on = True
                        wipe_speed = gcode.last_match[3]
                        wipe_indexes.append((index, gcode.last_match[0], gcode.last_match[1], wipe_speed))
                        wipe_layer = layer
                elif gcode.is_extrusion_move(cmd):
                    # detect retract/wipe
                    if gcode.last_match[2] < 0:
                        wipe_on = True
                        wipe_speed = last_move_speed or self.default_speed
                        wipe_indexes.append((index, gcode.last_match[0], gcode.last_match[1], wipe_speed))
                        wipe_layer = layer
                elif gcode.is_head_move(cmd) and wipe_on:
                    # retract/wipe ended
                    last_move_speed = gcode.last_match[2]
                    wipe_on = False
                    for index, x, y, speed in wipe_indexes:
                        wipe_layer.replace_line(index, gcode.generate_head_move_gcode(x, y, speed), b"fixed wipe")
                    first_wipe = wipe_indexes[0][0]
                    wipe_layer.insert_line(first_wipe, *extruder.get_retract_gcode())
                    wipe_indexes = []
                elif gcode.is_tool_change(cmd) is not None:
                    # tool change, set active extruder
                    extruder = self.extruders[gcode.last_match]

if __name__ == "__main__":
    import logger
    logger = logger.Logger(".")
    s = Simplify3dGCodeFile(logger, PEEK)
    print(s.check_layer_change(b" layer 1, Z = 1", None))