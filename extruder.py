
class Extruder:
    def __init__(self, tool, nozzle, retract, retract_speed, z_hop):
        self.tool = tool
        self.nozzle = nozzle
        self.retract = retract
        self.retract_speed = retract_speed
        self.z_hop = z_hop
        self.feed_rate = 0.04 # TODO: need autodetection?
        self.current_z = None

    def get_feed_length(self, move_lenght):
        """ Returns the lenght of filament to extrude for given move.
            Values in mm.
        """
        return move_lenght * self.feed_rate