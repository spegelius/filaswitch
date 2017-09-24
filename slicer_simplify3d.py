import logging
import re
from extruder import Extruder
from switch_tower import PEEK
from gcode import GCode
from layer import FirstLayer, ACT_INFILL, ACT_PASS, ACT_SWITCH, Layer

import utils
from gcode_file import SLICER_SIMPLIFY3D, GCodeFile

gcode = GCode()
log = logging.getLogger("S3DSlicer")


class Simplify3dGCodeFile(GCodeFile):

    slicer_type = SLICER_SIMPLIFY3D

    LAYER_START_RE = re.compile(b".*layer (\d+), Z = (\d+\.*\d*)")
    VERSION_RE = re.compile(b".*Version (\d)\.(\d)\.(\d)")

    def __init__(self, logger, hw_config, tower_position, purge_lines):
        super().__init__(logger, hw_config, tower_position, purge_lines)
        self.extruder_diameter = []
        self.extruder_multiplier = []
        self.extruder_use_retract = []
        self.extruder_retract_dist = []
        self.extruder_retract_speed = []
        self.extruder_zhop = []
        self.extruder_use_coasting = []
        self.extruder_coasting = []
        self.extruder_use_wipe = []
        self.extruder_wipe = []
        self.relative_e = False
        self.retract_while_wiping = False
        self.version = None

        self.default_speed = None
        self.machine_type = None
        self.stroke_x = None
        self.stroke_y = None
        self.origin_offset_x = None
        self.origin_offset_y = None

    def process(self, gcode_file):
        self.open_file(gcode_file)
        self.parse_header()
        self.get_extruders()
        self.parse_print_settings()
        self.filter_layers()
        self.fix_retract_during_wipe()
        self.parse_perimeter_rates()
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
            self.extruders[i] = Extruder(i)
            self.extruders[i].nozzle = self.extruder_diameter[i]
            if self.extruder_use_retract[i]:
                self.extruders[i].retract = self.extruder_retract_dist[i]
                self.extruders[i].retract_speed = self.extruder_retract_speed[i]
            self.extruders[i].z_hop = self.extruder_zhop[i]
            if self.extruder_use_coasting[i]:
                self.extruders[i].coasting = self.extruder_coasting[i]
            if self.extruder_use_wipe[i]:
                self.extruders[i].wipe = self.extruder_wipe[i]
            self.extruders[i].feed_rate_multiplier = self.extruder_multiplier[i]

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
            elif b"extrusionMultiplier" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_multiplier.append(float(d))
            elif b"extruderUseRetract" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_use_retract.append(d == b"1")
            elif b"extruderRetractionDistance" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_retract_dist.append(float(d))
            elif b"extruderRetractionZLift" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_zhop.append(float(d))
            elif b"extruderUseCoasting" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_use_coasting.append(d == b"1")
            elif b"extruderCoastingDistance" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_coasting.append(float(d))
            elif b"extruderUseWipe" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_use_wipe.append(d == b"1")
            elif b"extruderWipeDistance" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_wipe.append(float(d))
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
            elif b"firstLayerUnderspeed" in comment:
                self.first_layer_speed = float(comment.split(b",")[-1])
            elif b"machineTypeOverride" in comment:
                self.machine_type = int(comment.split(b",")[-1])
            elif b"strokeXoverride" in comment:
                self.stroke_x = float(comment.split(b",")[-1])
            elif b"strokeYoverride" in comment:
                self.stroke_y = float(comment.split(b",")[-1])
            elif b"originOffsetXoverride" in comment:
                self.origin_offset_x = float(comment.split(b",")[-1])
            elif b"originOffsetYoverride" in comment:
                self.origin_offset_y = float(comment.split(b",")[-1])

        if not self.relative_e:
            raise ValueError("Relative E distances not enabled! Filaswitch won't work without relative E distances")
        if not self.version:
            self.log.warning("Could not detect Simplify3D version. Use at your own risk")
        else:
            self.log.info("Simplify3D version %d.%d.%d" % self.version)

        self.outer_perimeter_speed *= self.default_speed
        self.first_layer_speed *= self.default_speed

    def parse_print_settings(self):
        """ S3D specific settings """

        super().parse_print_settings()

        for cmd, comment, line_index in self.layers[0].read_lines():
            # find first tool change and remove it if it's T0. No need to
            # do tool change as e already have T0 active
            if line_index > self.layers[0].start_gcode_end and cmd and gcode.is_tool_change(cmd) == 0:
                self.layers[0].delete_line(line_index)
                break

    def parse_layers(self, lines):
        """
        Go through the g-code and find layer start points.
        Store each layer to list.
        :return:
        """
        prev_layer = None
        prev_height = 0
        current_layer = FirstLayer(1, 0.2, 0.2)
        for line in lines:
            cmd, comment = gcode.read_gcode_line(line)
            if comment:
                ret = self.check_layer_change(comment, None)
                if ret:
                    if current_layer.num == 1 and ret[0] == 1:
                        current_layer.z = ret[1]
                    else:
                        if prev_layer:
                            prev_z = prev_layer.z
                        else:
                            prev_z = 0

                        height = current_layer.z - prev_z
                        if height:
                            prev_height = height
                        else:
                            height = prev_height

                        self.layers.append(current_layer)
                        prev_layer = current_layer
                        current_layer = Layer(ret[0], ret[1], height)
            current_layer.add_line(cmd, comment)

        # last layer
        self.layers.append(current_layer)

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

    def filter_layers(self):
        """
        Filter layers so that only layers relevant purge tower processing
        are returned. Also layers are tagged for action (tool witch, infill, pass)
        Layers that are left out:
        - empty (no command lines)
        - non-tool
        :return: none
        """

        # maxes = [last_switch_heights[k] for k in last_switch_heights]
        # maxes.sort(reverse=True)
        # last_switch_height = maxes[1]
        # print(last_switch_heights)
        # print(last_switch_height)

        layer_data = {}

        # step 1: filter out empty layers and add populate dictionary
        for layer in self.layers:
            if layer.z not in layer_data:
                layer_data[layer.z] = {'layers': []}

            layer_data[layer.z]['layers'].append(layer)

        # z-list sorted
        zs = sorted(layer_data.keys())

        # get needed slot counts per layer by going through reversed z-position list.
        # if there are only few changes for slot, tuck them in the previous slot
        slots = 1
        zs.reverse()
        count = 0
        for z in zs:
            lrs = 0
            for l in layer_data[z]['layers']:
                # each layer counts whether there's tool changes or not
                lrs += l.has_tool_changes()
            if lrs > slots:
                count += 1
            if count >= 3:
                slots = lrs
                count = 0
            layer_data[z]['slots'] = slots

        self.max_slots = slots
        #print(self.max_slots)

        # tag layers for actions: tool change, infill, etc
        zs.reverse()
        for z in zs:

            if layer_data[z]['slots'] == 0:
                continue

            slots_filled = 0
            # first check tool change layers
            for l in layer_data[z]['layers']:
                l.tower_slots = layer_data[z]['slots']
                if l.has_tool_changes():
                    l.action = ACT_SWITCH
                    slots_filled += 1

            # then check other layers
            for l in layer_data[z]['layers']:
                if not l.has_tool_changes():
                    if slots_filled < layer_data[z]['slots']:
                        l.action = ACT_INFILL
                        slots_filled += 1
                    else:
                        l.action = ACT_PASS

        # step 3: pack groups to list
        layers = []
        for z in zs:
            for l in layer_data[z]['layers']:
                layers.append(l)
        self.filtered_layers = sorted(layers, key=lambda x: x.num)

    def fix_retract_during_wipe(self):
        """
        Fix S3D 3.1.1 bug where option "Retract during wipe" causes over-extrusion
        :return: none
        """
        if not self.retract_while_wiping:
            # not needed
            return
        if not self.version == (3,1,1):
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
                        wipe_layer.replace_line(index, gcode.gen_head_move(x, y, speed), b"fixed wipe")
                    first_wipe = wipe_indexes[0][0]
                    wipe_layer.insert_line(first_wipe, *extruder.get_retract_gcode())
                    wipe_indexes = []
                elif gcode.is_tool_change(cmd) is not None:
                    # tool change, set active extruder
                    extruder = self.extruders[gcode.last_match]

    def parse_perimeter_rates(self):
        """
        Parses perimeter print sped and feed rate for each layer
        :return: none
        """
        last_speed = None
        last_feed_rate = None
        for layer in self.layers:
            speed, rate = layer.get_outer_perimeter_rates()
            if speed and rate:
                last_speed = speed
                last_feed_rate = rate
            else:
                layer.outer_perimeter_speed = last_speed
                layer.outer_perimeter_feedrate = last_feed_rate

        # second pass, check that every layer has a speed and feed rate
        for layer in self.layers:
            if not layer.outer_perimeter_speed:
                if isinstance(layer, FirstLayer):
                    layer.outer_perimeter_speed = self.first_layer_speed
                    layer.outer_perimeter_feedrate = last_feed_rate
                else:
                    layer.outer_perimeter_speed = last_speed
                    layer.outer_perimeter_feedrate = last_feed_rate
            else:
                last_speed = layer.outer_perimeter_speed
                last_feed_rate = layer.outer_perimeter_feedrate


if __name__ == "__main__":
    import logger
    logger = logger.Logger(".")
    s = Simplify3dGCodeFile(logger, PEEK)
    print(s.check_layer_change(b" layer 1, Z = 1", None))