
class Extruder:
    def __init__(self, tool, nozzle, retract, retract_speed, z_hop):
        self.tool = tool
        self.nozzle = nozzle
        self.retract = retract
        self.retract_speed = retract_speed
        self.z_hop = z_hop
        self.feed_rate = 0.04 # TODO: need autodetection?
        self.feed_rate_max = 0.1 # don't go over this
        self.current_z = None

    def get_feed_length(self, move_length, feed_rate=None):
        """
        Returns the lenght of filament to extrude for given move.
            Values in mm.
        :param move_length: x/y movement length
        :param feed_rate: optional feed rate value
        :return: extrusion feed length
        """
        if not feed_rate:
            if self.feed_rate > self.feed_rate_max:
                raise ValueError("Feed rate too high! Aborting")
            return move_length * self.feed_rate
        if self.feed_rate > self.feed_rate_max:
            raise ValueError("Feed rate too high! Aborting")
        return move_length * feed_rate

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
