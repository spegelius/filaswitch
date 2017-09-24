
class Extruder:
    def __init__(self, tool):
        self.tool = tool
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

    def get_retract_gcode(self, change=0):
        """
        Get retraction g-code line
        :param change: add this to the length
        :return: retraction byte string
        """
        return ("G1 E%.4f F%.1f" % (-(self.retract+change), self.retract_speed)).encode(), b" retract"

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