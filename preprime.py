import math

from gcode import GCode, E,N
from settings import Settings

import utils

gcode = GCode()


class PrePrime:

    def __init__(self, logger, settings: Settings, max_slots, extruders, tools):

        # localize
        self.E = E
        self.N = N

        self.vertical_dir = N
        self.horizontal_dir = E
        
        self.settings = settings
        self.log = logger
        self.extruders = extruders
        self.tools = tools
        self.start_pos_x = None
        self.start_pos_y = None

        self.width =settings.get_hw_config_float_value("prerun.prime.length")
        self.elength = settings.get_hw_config_float_value("prerun.prime.extrusion.length")
        self.speed = settings.get_hw_config_int_value("prerun.prime.speed")
        self.gap = settings.get_hw_config_float_value("prerun.prime.gap")
        self.purgecount = settings.get_hw_config_int_value("prerun.prime.purge.count")
        self.xstart = settings.get_hw_config_float_value("prerun.prime.xstart")
        self.ystart = settings.get_hw_config_float_value("prerun.prime.ystart")
        
        
    def initialize_slots(self):
        """
        Initialize slot data, just for horz/vert movement
        :return:
        """
        self.max_slots = 16
        for i in range(self.max_slots):
            self.slots[i] = {}
            self.slots[i]['horizontal_dir'] = self.E
            self.slots[i]['vertical_dir'] = self.N

    def get_prime_gcode(self, extruder):
        """

        """
        feed_rate = self.settings.get_hw_config_float_value("prerun.prime.extrusion.length") / self.width

        sweep_speed = self.settings.get_hw_config_float_value("prerun.prime.speed")
        sweep_gap = self.settings.get_hw_config_float_value("prerun.prime.gap")
        sweep_gap_speed = self.settings.get_hw_config_float_value("prepurge.sweep.gap.speed")

        for _ in range(self.settings.get_hw_config_int_value("prerun.prime.purge.count")):
            yield gcode.gen_direction_move(self.horizontal_dir, self.width, sweep_speed, extruder, feed_rate=feed_rate), b" purge trail"
            yield gcode.gen_direction_move(self.vertical_dir, sweep_gap, sweep_gap_speed), b" Y shift"
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
                if i == 0:
                    log.warning("No rapid.retract.initial[N].length or .speed found. Please check the HW-config")
                break
        i = 0
        while True:
            try:
                rr_long_len = self.settings.get_hw_config_float_value("rapid.retract.long[{}].length".format(i))
                rr_long_speed = self.settings.get_hw_config_float_value("rapid.retract.long[{}].speed".format(i))
                yield gcode.gen_extruder_move(-rr_long_len, rr_long_speed), b" long retract"
                i += 1
            except TypeError:
                if i == 0:
                    log.warning("No rapid.retract.long[N].length or .speed found. Please check the HW-config")
                break
                
        #cooling retracts, also serves as wipe

        i = 0
        while True:
            try:
                rr_cool_len = self.settings.get_hw_config_float_value("rapid.retract.cool[{}].length".format(i))
                rr_cool_speed = self.settings.get_hw_config_float_value("rapid.retract.cool[{}].speed".format(i))
                yield gcode.gen_direction_move(self.horizontal_dir, self.width, rr_cool_speed, extruder, e_length=rr_cool_len), b" cooling"
                self.horizontal_dir = gcode.opposite_dir(self.horizontal_dir)
                i += 1
            except TypeError:
                if i == 0:
                    log.warning("No cooling steps. That's OK.")
                break
        self.horizontal_dir = E               
    def get_feed_gcode(self, extruder):
        
        i = 0
        #initial load using standard feed length and speed
        while True:
            try:
                feed_len = self.settings.get_hw_config_float_value("feed[{}].length".format(i))
                feed_speed = self.settings.get_hw_config_float_value("feed[{}].speed".format(i))
                yield gcode.gen_direction_move(self.horizontal_dir, self.width, feed_speed, extruder, e_length=feed_len), b" prime move"
                self.horizontal_dir = gcode.opposite_dir(self.horizontal_dir)
                i += 1
            except TypeError:
                if i == 0:
                    log.warning("No prime move steps. That's OK.")
                break

    def get_prime_lines(self):
        """

        """
        yield None, b" PRIME START"
        #Reverse order
        for tool in self.tools[::-1]:
            #get extruder object from tool number
            extruder = self.extruders[tool]
            #print(extruder.tool)
            yield ("T%s" % tool).encode(), b" change tool"
            #move to start position
            yield (gcode.gen_head_move(self.xstart, self.ystart, self.speed), b" move off print")
            #relative movement
            yield (b"G91", b" relative positioning")
            #load and initial prime 
            for line in self.get_feed_gcode(extruder):
                yield line
            #handle unload and wipe
            for line in self.get_prime_gcode(extruder):
                yield line
            #Do retraction if not on the last extruder
            if tool != self.tools[0]:
                for line in self.get_retract_gcode(extruder):
                    yield line                   
            #absolute movement
            yield (b"G90", b" absolute positioning")
            self.xstart = self.xstart + self.width + 1


if __name__ == "__main__":
    from logger import Logger
    log = Logger(".")
    st = PrePurge(0, 1, log, PEEK)
    
