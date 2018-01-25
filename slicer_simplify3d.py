import logging
import re
from extruder import Extruder
from gcode import GCode
from layer import FirstLayer, ACT_INFILL, ACT_PASS, ACT_SWITCH, Layer

import utils
from gcode_file import SLICER_SIMPLIFY3D, GCodeFile
from settings import Settings

gcode = GCode()
log = logging.getLogger("S3DSlicer")


class Simplify3dGCodeFile(GCodeFile):

    slicer_type = SLICER_SIMPLIFY3D

    LAYER_START_RE = re.compile(b".*layer (\d+), Z = (\d+\.*\d*)")
    VERSION_RE = re.compile(b".*Version (\d)\.(\d)\.(\d)")

    def __init__(self, logger, settings: Settings):
        super().__init__(logger, settings)
        self.extruder_name = []
        self.extruder_tool = []
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

        self.temperature_names = []
        self.temperature_numbers = []
        self.temperature_setpoints = []
        self.temperature_setpoint_layers = []
        self.temperature_setpoint_temps = []
        self.temperature_heated_bed = []

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
            self.add_tool_change_gcode()
        else:
            self.log.info("No tool changes detected, skipping tool change g-code additions")
        return self.save_new_file()

    def get_extruders(self):
        """
        Populate extruder list
        :return:
        """

        for i in range(len(self.extruder_name)):
            t = self.extruder_tool[i]
            name = self.extruder_name[i]
            ext = Extruder(t, name=name)
            ext.nozzle = self.extruder_diameter[i]
            if self.extruder_use_retract[i]:
                ext.retract = self.extruder_retract_dist[i]
                ext.retract_speed = self.extruder_retract_speed[i]
            ext.z_hop = self.extruder_zhop[i]
            if self.extruder_use_coasting[i]:
                ext.coasting = self.extruder_coasting[i]
            if self.extruder_use_wipe[i]:
                ext.wipe = self.extruder_wipe[i]
            ext.feed_rate_multiplier = self.extruder_multiplier[i]


            self.extruders[t] = ext

        # go through the temperature names and try to assign them to extruders
        temp_setpoint_index = 0
        for i in range(len(self.temperature_names)):
            if self.temperature_heated_bed[i] == 0:
                t = self.temperature_numbers[i]
                ext = self.extruders[t]
                ext.temperature_nr = t
                for j in range(self.temperature_setpoints[i]):
                    layer_nr = self.temperature_setpoint_layers[temp_setpoint_index]
                    ext.temperature_setpoints[layer_nr] = self.temperature_setpoint_temps[temp_setpoint_index]
                    temp_setpoint_index += 1

        # find proper setpoint temp
        last_setpoints = None
        for e in self.extruders:
            # setpoints
            if self.extruders[e].temperature_setpoints:
                last_setpoints = self.extruders[e].temperature_setpoints
                break

        # if not found, bad config
        if not last_setpoints:
            raise ValueError("Could not find valid temperature settings for extruder(s). Please check S3D profile")

        warning = False
        for e in self.extruders:
            if not self.extruders[e].temperature_setpoints:
                self.extruders[e].temperature_setpoints = last_setpoints
                warning = True

            # temp nr. Use tool number if not defined
            if self.extruders[e].temperature_nr is None:
                self.extruders[e].temperature_nr = self.extruders[e].tool

        if warning:
            self.log.info("Not all extruders have valid temperature definitions, using previous extruder values. Please check profile temperature settings")

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
                    self.log.exception("Version parsing exception: %s" % e)
            elif b"extruderName" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_name.append(d)
            elif b"extruderToolheadNumber" in comment:
                for d in comment.split(b",")[1:]:
                    self.extruder_tool.append(int(d))
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
                self.settings.default_speed = int(comment.split(b",")[-1])
            elif b"rapidXYspeed" in comment:
                self.settings.travel_xy_speed = int(comment.split(b",")[-1])
            elif b"rapidZspeed" in comment:
                self.settings.travel_z_speed = int(comment.split(b",")[-1])
            elif b"outlineUnderspeed" in comment:
                self.settings.outer_perimeter_speed = float(comment.split(b",")[-1])
            elif b"solidInfillUnderspeed" in comment:
                self.infill_speed = float(comment.split(b",")[-1])
            elif b"supportUnderspeed" in comment:
                self.support_speed = float(comment.split(b",")[-1])
            elif b"firstLayerUnderspeed" in comment:
                self.settings.first_layer_speed = float(comment.split(b",")[-1])
            elif b"machineTypeOverride" in comment:
                self.settings.machine_type = int(comment.split(b",")[-1])
            elif b"strokeXoverride" in comment:
                self.settings.stroke_x = float(comment.split(b",")[-1])
            elif b"strokeYoverride" in comment:
                self.settings.stroke_y = float(comment.split(b",")[-1])
            elif b"originOffsetXoverride" in comment:
                self.settings.origin_offset_x = float(comment.split(b",")[-1])
            elif b"originOffsetYoverride" in comment:
                self.settings.origin_offset_y = float(comment.split(b",")[-1])
            elif b"gcodeZoffset" in comment:
                self.settings.z_offset = float(comment.split(b",")[-1])
            elif b"temperatureName" in comment:
                for d in comment.split(b",")[1:]:
                    self.temperature_names.append(d)
            elif b"temperatureNumber" in comment:
                for d in comment.split(b",")[1:]:
                    self.temperature_numbers.append(int(d))
            elif b"temperatureSetpointCount" in comment:
                for d in comment.split(b",")[1:]:
                    self.temperature_setpoints.append(int(d))
            elif b"temperatureSetpointLayers" in comment:
                for d in comment.split(b",")[1:]:
                    self.temperature_setpoint_layers.append(int(d))
            elif b"temperatureSetpointTemperatures" in comment:
                for d in comment.split(b",")[1:]:
                    self.temperature_setpoint_temps.append(int(d))
            elif b"temperatureHeatedBed" in comment:
                for d in comment.split(b",")[1:]:
                    self.temperature_heated_bed.append(int(d))
            #elif b"toolChangeRetractionDistance" in comment:
            #    if comment.split(b",")[1] != b"0":
            #        self.log.warning("'toolChangeRetractionDistance' is set to 0. This might cause quality problems. Check 'Other'-tab in S3D.")
            #elif b"toolChangeExtraRestartDistance" in comment:
            #    if comment.split(b",")[1] != b"0":
            #        self.log.warning("'toolChangeExtraRestartDistance' is not set to 0. This might cause quality problems. Check 'Other'-tab in S3D.")

        if not self.relative_e:
            raise ValueError("Relative E distances not enabled! Filaswitch won't work without relative E distances")
        if not self.version:
            self.log.warning("Could not detect Simplify3D version. Use at your own risk")
        else:
            self.log.info("Simplify3D version %d.%d.%d" % self.version)

        if self.layer_height != 0.2:
            raise ValueError("Layer height must be 0.2, Filaswitch does not support any other layer height at the moment")

        self.settings.outer_perimeter_speed *= self.settings.default_speed
        self.settings.first_layer_speed *= self.settings.default_speed

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
                        current_layer.height = ret[1]
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
        if len(self.layers) <= 1:
            raise ValueError("Detected only one layer, possibly an parsing error. Processing halted")

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

        # step 1: filter out empty layers and populate dictionary
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
                        wipe_speed = last_move_speed or self.settings.default_speed
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

        # use constant speed, too fancy to adjust all the time
        # use static values for all layers
        for layer in self.layers:
            layer.outer_perimeter_speed = self.settings.outer_perimeter_speed
            layer.outer_perimeter_feedrate = 0.05

        # last_speed = None
        # last_feed_rate = None
        # for layer in self.layers:
        #     speed, rate = layer.get_outer_perimeter_rates()
        #     if speed and rate:
        #         last_speed = speed
        #         last_feed_rate = rate
        #     else:
        #         layer.outer_perimeter_speed = last_speed
        #         layer.outer_perimeter_feedrate = last_feed_rate
        #
        # # second pass, check that every layer has a speed and feed rate
        # for layer in self.layers:
        #     if not layer.outer_perimeter_speed:
        #         if isinstance(layer, FirstLayer):
        #             layer.outer_perimeter_speed = self.settings.first_layer_speed
        #             layer.outer_perimeter_feedrate = last_feed_rate
        #         else:
        #             layer.outer_perimeter_speed = last_speed
        #             layer.outer_perimeter_feedrate = last_feed_rate
        #     else:
        #         last_speed = layer.outer_perimeter_speed
        #         last_feed_rate = layer.outer_perimeter_feedrate


if __name__ == "__main__":
    import logger
    logger = logger.Logger(".")
    s = Simplify3dGCodeFile(logger, PEEK)
    print(s.check_layer_change(b" layer 1, Z = 1", None))
