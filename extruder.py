
class Extruder:
    def __init__(self, tool, name=None):
        self.tool = tool
        self.name = name
        self.nozzle = 0.0
        self.retract = 0.0
        self.retract_speed = 0.0
        self.z_hop = 0.0
        self.z_offset = 0.0
        self.feed_rate = 0.04 # TODO: need autodetection?
        self.feed_rate_max = 0.2 # don't go over this
        self.feed_rate_multiplier = 1
        self.current_z = None
        self.coasting = 0.0
        self.wipe = 0.0
        self.filament_type = None
        self.temperature_nr = None
        self.temperature_setpoints = {}

    def get_feed_length(self, move_length, feed_rate=None):
        """
        Returns the lenght of filament to extrude for given move.
            Values in mm.
        :param move_length: x/y movement length
        :param feed_rate: optional feed rate value
        :return: extrusion feed length
        """
        if not feed_rate:
            rate = self.feed_rate
        else:
            rate = feed_rate

        rate *= self.feed_rate_multiplier
        if rate > self.feed_rate_max:
            raise ValueError("Feed rate too high! Aborting")
        return move_length * rate

    def get_retract_gcode(self, change=0.0, comment=b" retract"):
        """
        Get retraction g-code line. Optionally add negative change-length to reduce the retract
        :param change: minus this of the length
        :return: retraction byte string
        """
        if change != 0 and abs(change) >= self.retract or change > 0:
            return None
        return ("G1 E%.4f F%.1f" % (-(self.retract+change), self.retract_speed)).encode(), comment

    def get_prime_gcode(self, change=0):
        """
        Get prime g-code line
        :param change: add this to the length
        :return: prime byt string
        """
        return ("G1 E%.4f F%.1f" % (self.retract+change, self.retract_speed)).encode(), b" prime"

    def get_feed_rate(self, multiplier=None):
        """
        Return extruder feed rate
        :param multiplier: optional multiplier
        :return: feed rate
        """
        if not multiplier:
            return self.feed_rate * self.feed_rate_multiplier
        return self.feed_rate * self.feed_rate_multiplier * multiplier

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

    print(test_e.get_retract_gcode(1))
    print(test_e.get_retract_gcode(0))
    print(test_e.get_retract_gcode(-0.1))
    print(test_e.get_retract_gcode(-0.5))
    print(test_e.get_retract_gcode(-1))