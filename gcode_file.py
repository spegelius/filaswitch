
import logging
import math
import os
import re
import statistics

from extruder import Extruder

from switch_tower import SwitchTower

log = logging.getLogger("filaswitch")

SLICER_CURA = "Cura"
SLICER_KISSLICER = "KISSlicer"
SLICER_SIMPLIFY3D = "Simplify3d"
SLICER_SLIC3R = "Slic3r"


class GCodeFile:
    slicer_type = None

    EXTRUDER_RETRACT_RE = re.compile(b"^G1 E([-]*\d+\.\d+) F(\d+\.*\d*)$")
    Z_MOVE_RE = re.compile(b"^G1 Z([-]*\d+\.\d+) F(\d+\.*\d*)$")
    EXTRUSION_MOVE_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) E(\d+\.\d+)")
    EXTRUSION_MOVE_SPEED_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) E(\d+\.\d+) F(\d+\.*\d*)$")
    MOVE_HEAD_RE = re.compile(b"^G1 X([-]*\d+\.\d+) Y([-]*\d+\.\d+) F(\d+\.*\d*)$")
    SPEED_RE = re.compile(b"^G1 F(\d+\.*\d*)$")
    EXTRUDER_POSITION_RE = re.compile(b"^G92 E0$")

    def __init__(self, debug=False):
        self.debug = debug
        if debug:
            log.setLevel(logging.DEBUG)
        else:
            log.setLevel(logging.INFO)
        self.settings = {}
        self.lines = []
        self.gcode_file = None
        self.line_index = 0
        self.material = None
        self.extruders = []
        self.start_gcode_end = 0

        self.switch_tower = None


    def parse_header(self):
        """ Do some header processing if you will"""
        self.line_index = 0

    def remove_comments(self):
        """ Removes comment lines """
        self.line_index = 0
        while True:
            try:
                if self.lines[self.line_index].startswith(b";"):
                    self.lines.pop(self.line_index)
                    continue
                self.lines[self.line_index] = self.lines[self.line_index].split(b";")[0].strip()
                self.line_index += 1
            except IndexError:
                return

    def open_file(self, gcode_file):
        """ Read given g-code file into list """
        self.gcode_file = gcode_file
        # open file
        try:
            gf = open(gcode_file, 'rb')
        except Exception as e:
            log.error("Cannot open file %s" % gcode_file)
            return 1

        # remove extra EOL and empty lines
        self.lines = [l.strip() for l in gf.readlines() if l.strip()]
        gf.close()

    def save_new_file(self):
        """ Save lines into new file """
        self.remove_comments()
        _dir, fname = os.path.split(self.gcode_file)
        name, ext = os.path.splitext(fname)
        newfile = os.path.join(_dir,  name + "_fs.bfb")
        try:
            with open(newfile, "wb") as nf:
                result = b"\r\n".join(self.lines)
                nf.write(result)
                log.info("Wrote new file: %s" % newfile)
                return newfile
        except Exception as e:
            log.error("Could not save file, error: %s" % e)
            return 1

    def read_line(self, index=None):
        """ Read current line or from given index. White space is removed.
            Returns a tuple of line and possible comment
        """
        if not index:
            l_index = self.line_index
        else:
            l_index = index
        if self.lines[l_index ].startswith(b";"):
            return self.lines[l_index ], None
        vals = self.lines[l_index ].strip().split(b";", 1)
        l = vals[0].strip()
        if len(vals) == 2:
            return l, vals[1]
        return l, None

    def calculate_path_length(self, prev_position, new_position):
        """ Calculate path length from given coordinates"""
        x_len = prev_position[0] - new_position[0]
        y_len = prev_position[1] - new_position[1]

        path_len = math.sqrt((x_len * x_len) + (y_len * y_len))
        return path_len

    def calculate_extrusion_length(self, prev_position, new_position):
        """ Calculates extrusion length"""
        length = abs(prev_position - new_position)
        return length

    def calculate_feed_rate(self, path_len, extrusion_length):
        """ Calculates feed rate from path length vs. extrusion length"""
        if not path_len or not extrusion_length:
            return 0.005 # hat constant instead of 0 extrusion. Bug in Slic3r? TODO: check this
        rate = 1 / (path_len / extrusion_length)
        return rate

    def delete_line(self, index=None):
        """ Deletes line from line list"""
        if not index:
            l_index = self.line_index
        else:
            l_index = index
        self.lines.pop(l_index)
        self.line_index -= 1

    def find_switch_position(self):
        """ Finds proper position for the switch tower"""
        self.line_index = self.start_gcode_end

        x = []
        y = []

        for l in self.lines:
            if l.startswith(b'G1'):
                if self.EXTRUSION_MOVE_RE.match(l):
                    values = self.EXTRUSION_MOVE_RE.match(l).groups()
                    x.append(float(values[0]))
                    y.append(float(values[1]))

        xmax = max(x)
        ymax = max(y)
        xmin = min(x)
        ymin = min(y)

        log.debug("Xmax: %s, Ymax: %s, Xmin: %s, Ymin: %s" %(xmax, ymax, xmin, ymin))

        self.switch_tower = SwitchTower((xmin, ymax+5))
        # TODO: check against bed dimensions

    def add_switch_raft(self):


        self.lines.insert()


    def process(self, gcode_file):
        """ Runs processing """
        self.open_file(gcode_file)
        self.parse_header()
        self.find_switch_position()
        self.add_switch_raft()

