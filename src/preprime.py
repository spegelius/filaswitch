from collections import OrderedDict

from gcode import GCode, E,N
from settings import Settings

gcode = GCode()


class PrePrime:

    def __init__(self, logger, settings: Settings, max_slots, extruders: OrderedDict):

        # localize
        self.E = E
        self.N = N

        self.vertical_dir = N
        self.horizontal_dir = E
        
        self.settings = settings
        self.log = logger
        self.extruders = extruders
        self.start_pos_x = None
        self.start_pos_y = None

        self.width =settings.get_hw_config_float_value("prerun.prime.length")
        self.elength = settings.get_hw_config_float_value("prerun.prime.extrusion.length")
        self.speed = settings.get_hw_config_int_value("prerun.prime.speed")
        self.gap = settings.get_hw_config_float_value("prerun.prime.gap")
        self.purgecount = settings.get_hw_config_int_value("prerun.prime.purge.count")
        self.xstart = settings.get_hw_config_float_value("prerun.prime.xstart")
        self.ystart = settings.get_hw_config_float_value("prerun.prime.ystart")
        self.warnings_shown = False

        # index of the extruder that's primed last
        self.last_tool = None

    def get_prime_gcode(self, extruder):
        """

        """
        e_length = self.settings.get_hw_config_float_value("prerun.prime.extrusion.length")

        sweep_speed = self.settings.get_hw_config_float_value("prerun.prime.speed")
        sweep_gap = self.settings.get_hw_config_float_value("prerun.prime.gap")
        sweep_gap_speed = self.settings.get_hw_config_float_value("prepurge.sweep.gap.speed")

        for _ in range(self.settings.get_hw_config_int_value("prerun.prime.purge.count")):
            yield gcode.gen_direction_move(self.horizontal_dir, self.width, sweep_speed, 0.2, extruder=extruder,
                                           e_length=e_length), b" purge trail"
            yield gcode.gen_direction_move(self.vertical_dir, sweep_gap, sweep_gap_speed, 0.2), b" Y shift"
            self.horizontal_dir = gcode.opposite_dir(self.horizontal_dir)

    def get_retract_gcode(self, extruder):
        i = 0
        while True:
            try:
                rr_len = self.settings.get_hw_config_float_value("rapid.retract.initial[{}].length".format(i))
                rr_speed = self.settings.get_hw_config_float_value("rapid.retract.initial[{}].speed".format(i))
                yield gcode.gen_extruder_move(-rr_len, rr_speed), b" rapid retract"
                i += 1
            except TypeError:
                if i == 0 and not self.warnings_shown:
                    self.log.warning("No rapid.retract.initial[N].length or .speed found. Please check the HW-config")
                break
        i = 0

        pause = self.settings.get_hw_config_float_value("rapid.retract.pause")
        if pause:
            yield gcode.gen_pause(pause), b" cooling period"

        while True:
            try:
                rr_long_len = self.settings.get_hw_config_float_value("rapid.retract.long[{}].length".format(i))
                rr_long_speed = self.settings.get_hw_config_float_value("rapid.retract.long[{}].speed".format(i))
                yield gcode.gen_extruder_move(-rr_long_len, rr_long_speed), b" long retract"
                i += 1
            except TypeError:
                if i == 0 and not self.warnings_shown:
                    self.log.warning("No rapid.retract.long[N].length or .speed found. Please check the HW-config")
                break

        # cooling retracts, also serves as wipe

        i = 0
        while True:
            try:
                rr_cool_len = self.settings.get_hw_config_float_value("rapid.retract.cool[{}].length".format(i))
                rr_cool_speed = self.settings.get_hw_config_float_value("rapid.retract.cool[{}].speed".format(i))
                yield gcode.gen_direction_move(self.horizontal_dir, self.width, rr_cool_speed, 0.2, extruder=extruder,
                                               e_length=rr_cool_len), b" cooling"
                self.horizontal_dir = gcode.opposite_dir(self.horizontal_dir)
                i += 1
            except TypeError:
                if i == 0 and not self.warnings_shown:
                    self.log.warning("No cooling steps. That's OK.")
                break

        # account for retract mismatch in preprime, caused by slower initial purge
        finetune = self.settings.get_hw_config_value("prerun.finetune.length")
        if finetune:
            yield gcode.gen_extruder_move(float(finetune), 500), b" preprime finetune"

        self.horizontal_dir = E

    def get_feed_gcode(self, extruder):
        
        i = 0
        # initial load using standard feed length and speed
        while True:
            try:
                feed_len = self.settings.get_hw_config_float_value("feed[{}].length".format(i))
                feed_speed = self.settings.get_hw_config_float_value("feed[{}].speed".format(i))
                yield gcode.gen_direction_move(self.horizontal_dir, self.width, feed_speed, 0.2, extruder=extruder,
                                               e_length=feed_len, e_speed=True), b" prime move"
                self.horizontal_dir = gcode.opposite_dir(self.horizontal_dir)
                i += 1
            except TypeError:
                if i == 0 and not self.warnings_shown:
                    self.log.warning("No prime move steps. That's OK.")
                break

    def get_prime_lines(self):
        """
        Generate lines for priming the extruders in reverse order (last extruder is primed first)
        """

        tools = list(self.extruders.keys())
        yield None, b" PRIME START"
        yield gcode.gen_relative_e(), b" relative E"
        z_pos = round(0.2 + self.settings.z_offset, 5)

        # turn linear advance off, if set
        if self.settings.linear_advance != 0:
            yield gcode.gen_lin_advance(0), b" turn off linear advance"

        # turn pressure advance off, if set
        if self.settings.pressure_advance:
            yield gcode.gen_pressure_advance(self.settings.pressure_advance[0], 0), b" turn off pressure advance"

        # Reverse order
        for tool in tools[::-1]:
            # get extruder object from tool number
            extruder = self.extruders[tool]

            # print(extruder.tool)
            yield gcode.gen_tool_change(tool), b" change tool"

            # move to start position
            yield (gcode.gen_head_move(self.xstart, self.ystart, self.speed), b" move off print")

            # move z close
            yield gcode.gen_z_move(z_pos, self.settings.travel_z_speed), b" move z close"

            # relative movement
            yield gcode.gen_relative_positioning(), b" relative positioning"

            # load and initial prime
            for line in self.get_feed_gcode(extruder):
                yield line

            # handle unload and wipe
            for line in self.get_prime_gcode(extruder):
                yield line

            # Do retraction if not on the last extruder
            if tool != tools[0]:
                for line in self.get_retract_gcode(extruder):
                    yield line

            if extruder.z_hop:
                # z-hop
                yield gcode.gen_z_move(z_pos + extruder.z_hop, self.settings.travel_z_speed), b" z-hop"

            # absolute movement
            yield gcode.gen_absolute_positioning(), b" absolute positioning"
            yield gcode.gen_relative_e(), b" relative E"
            yield gcode.gen_extruder_reset(), b" reset extruder"

            self.xstart = self.xstart + self.width + 1
            self.warnings_shown = True

            self.last_tool = tool

        # turn linear advance back on, if set
        if self.settings.linear_advance != 0:
            yield gcode.gen_lin_advance(self.settings.linear_advance), b" turn on linear advance"

        # turn pressure advance back on, if set
        if self.settings.pressure_advance:
            yield gcode.gen_pressure_advance(*self.settings.pressure_advance), b" turn on pressure advance"

        yield None, b"PRIME END"
