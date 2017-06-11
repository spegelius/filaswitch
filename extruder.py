
class Extruder:
    def __init__(self, tool=0):
        self.tool = tool
        self.nozzle = None
        self.retract = None
