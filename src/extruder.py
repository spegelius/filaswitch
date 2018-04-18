import utils

from gcode import GCode

gcode = GCode()


class Extruder:

    def __init__(self, tool, name=None):
        self.tool = tool
        self.name = name
        self.nozzle = None
        self.extrusion_width = None
        self.retract = 0.0
        self.retract_speed = 0.0
        self.z_hop = 0.0
        self.z_offset = 0.0
        self.feed_rate_max = 0.2 # don't go over this
        self.feed_rate_multiplier = 1 # slicer default feed multi
        self.current_z = None
        self.coasting = 0.0
        self.wipe = 0.0
        self.filament_type = None
        self.filament_d = 1.75
        self.temperature_nr = None
        self.temperature_setpoints = {}
        self.minimum_extrusion = 0.01

    def get_feed_length(self, move_length, layer_height, feed_multi=1.0):
        """
        Returns the lenght of filament to extrude for given move.
        Values in mm.
        :param move_length: x/y movement length
        :param layer_height: layer height
        :param feed_multi: optional feed rate multiplier
        :return: extrusion feed length
        """
        rate = utils.extrusion_feed_rate(self.extrusion_width, layer_height, self.filament_d)
        rate *= self.feed_rate_multiplier * feed_multi
        if rate > self.feed_rate_max:
            raise ValueError("Feed rate too high ({}, layer h {})! Aborting.".format(rate, layer_height))
        return move_length * rate

    def get_retract_gcode(self, change=0.0, comment=b" retract"):
        """
        Get retraction g-code line. Optionally add negative change-length to reduce the retract
        :param change: minus this of the length
        :param: comment: gcode comment (default 'retract')
        :return: retraction byte string
        """
        if change != 0 and abs(change) >= self.retract or change > 0:
            return None
        if change > -0.05:
            change = 0
        if self.retract + change <= self.minimum_extrusion:
            return None
        return gcode.gen_extruder_move(-(self.retract+change), self.retract_speed), comment

    def get_prime_gcode(self, change=0.0, comment=b" prime"):
        """
        Get prime g-code line
        :param change: add this to the length
        :param: comment: gcode comment (default 'prime')
        :return: prime byte string
        """
        prime = self.retract + change
        if prime <= 0:
            return
        elif prime > self.retract:
            prime = self.retract
        elif prime <= self.minimum_extrusion:
            return None
        return gcode.gen_extruder_move(prime, self.retract_speed), comment

    def get_feed_rate(self, layer_height, multiplier=None):
        """
        Return extruder feed rate
        :param layer_height: layer height
        :param multiplier: optional multiplier
        :return: feed rate
        """
        rate = utils.extrusion_feed_rate(self.nozzle, layer_height, self.filament_d)
        if not multiplier:
            return rate * self.feed_rate_multiplier
        return rate * self.feed_rate_multiplier * multiplier

    def get_temperature(self, layer_nr):
        """
        Return nozzle temperature for given layer
        :param layer_nr: layer number
        :return: temperature
        """
        last_temp = None
        for lr in self.temperature_setpoints:
            if layer_nr <= lr:
                return self.temperature_setpoints[lr]

            last_temp = self.temperature_setpoints[lr]
        return last_temp


if __name__ == "__main__":
    test_e = Extruder(1)
    test_e.retract = 1
    test_e.retract_speed = 1500
    test_e.temperature_nr = 2
    test_e.temperature_setpoints[2] = 200
    test_e.temperature_setpoints[4] = 250
    print(test_e.get_temperature(1))
    print(test_e.get_temperature(2))
    print(test_e.get_temperature(3))
    print(test_e.get_temperature(4))
    print(test_e.get_temperature(5))
    print(test_e.get_temperature(6))

    print("RETRACT")
    print(test_e.get_retract_gcode(1))
    print(test_e.get_retract_gcode(0))
    print(test_e.get_retract_gcode(-0.1))
    print(test_e.get_retract_gcode(-0.5))
    print(test_e.get_retract_gcode(-1))
    print(test_e.get_retract_gcode(-0.001))
    print(test_e.get_retract_gcode(-0.995))

    print("PRIME")
    print(test_e.get_prime_gcode(1))
    print(test_e.get_prime_gcode(0))
    print(test_e.get_prime_gcode(-0.1))
    print(test_e.get_prime_gcode(-0.5))
    print(test_e.get_prime_gcode(-1))
    print(test_e.get_prime_gcode(-0.001))
    print(test_e.get_prime_gcode(-0.995))