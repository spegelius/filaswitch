
import os
import utils

AUTO = "Automatic"
LEFT = "Left"
RIGHT = "Right"
TOP = "Top"
BOTTOM = "Bottom"
TOWER_POSITIONS = [AUTO, LEFT, RIGHT, TOP, BOTTOM]

LINES = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
LINE_COUNT_DEFAULT = 6

# -1 is Auto
BRIM_SIZE = [2, 3, 4, 5, 6, 7, 8, 9, 10]
BRIM_DEFAULT = 3
BRIM_AUTO = "Auto"

class Settings:

    def __init__(self):
        self._hw_config = None
        self._purge_lines = LINE_COUNT_DEFAULT
        self._tower_position = None
        self._raft_multi = 100

        # print settings
        self._default_speed = None
        self._travel_xy_speed = None
        self._travel_z_speed = None
        self._outer_perimeter_speed = None
        self._first_layer_speed = None

        # machine limits. Populate these values in slicer specific implementations
        self._machine_type = None
        self._stroke_x = None
        self._stroke_y = None
        self._origin_offset_x = None
        self._origin_offset_y = None
        self._z_offset = 0
        self._extrusion_width = None

        # print settings
        self._brim = BRIM_DEFAULT
        self._brim_auto = False
        self._force_raft = False

        self.hw_configurations = {}
        self.read_hw_configs()

    @property
    def hw_config(self):
        return self._hw_config

    @hw_config.setter
    def hw_config(self, value):
        self._hw_config = value

    @property
    def purge_lines(self):
        return self._purge_lines

    @purge_lines.setter
    def purge_lines(self, value: int):
        self._purge_lines = value

    @property
    def tower_position(self):
        return self._tower_position

    @tower_position.setter
    def tower_position(self, value):
        self._tower_position = value

    @property
    def raft_multi(self):
        return self._raft_multi

    @raft_multi.setter
    def raft_multi(self, value):
        self._raft_multi = value

    @property
    def default_speed(self):
        return self._default_speed

    @default_speed.setter
    def default_speed(self, value: float):
        self._default_speed = value

    @property
    def travel_xy_speed(self):
        return self._travel_xy_speed

    @travel_xy_speed.setter
    def travel_xy_speed(self, value: float):
        self._travel_xy_speed = value

    @property
    def travel_z_speed(self):
        return self._travel_z_speed

    @travel_z_speed.setter
    def travel_z_speed(self, value: float):
        self._travel_z_speed = value

    @property
    def outer_perimeter_speed(self):
        return self._outer_perimeter_speed

    @outer_perimeter_speed.setter
    def outer_perimeter_speed(self, value: float):
        self._outer_perimeter_speed = value

    @property
    def first_layer_speed(self):
        return self._first_layer_speed

    @first_layer_speed.setter
    def first_layer_speed(self, value: float):
        self._first_layer_speed = value

    @property
    def machine_type(self):
        return self._machine_type

    @machine_type.setter
    def machine_type(self, value: int):
        self._machine_type = value

    @property
    def stroke_x(self):
        return self._stroke_x

    @stroke_x.setter
    def stroke_x(self, value: float):
        self._stroke_x = value

    @property
    def stroke_y(self):
        return self._stroke_y

    @stroke_y.setter
    def stroke_y(self, value: float):
        self._stroke_y = value

    @property
    def origin_offset_x(self):
        return self._origin_offset_x

    @origin_offset_x.setter
    def origin_offset_x(self, value: float):
        self._origin_offset_x = value

    @property
    def origin_offset_y(self):
        return self._origin_offset_y

    @origin_offset_y.setter
    def origin_offset_y(self, value: float):
        self._origin_offset_y = value

    @property
    def z_offset(self):
        return self._z_offset

    @z_offset.setter
    def z_offset(self, value: float):
        self._z_offset = value

    @property
    def brim(self):
        return self._brim

    @brim.setter
    def brim(self, value: int):
        if value not in BRIM_SIZE:
            if value > max(BRIM_SIZE):
                self._brim = max(BRIM_SIZE)
            elif value < min(BRIM_SIZE):
                self._brim = min(BRIM_SIZE)
        else:
            self._brim = value

    @property
    def brim_auto(self):
        return self._brim_auto

    @brim_auto.setter
    def brim_auto(self, value: bool):
        self._brim_auto = value

    @property
    def extrusion_width(self):
        return self._extrusion_width

    @extrusion_width.setter
    def extrusion_width(self, value: float):
        self._extrusion_width = value

    @property
    def force_raft(self):
        return self._force_raft

    @force_raft.setter
    def force_raft(self, value: bool):
        self._force_raft = value

    def read_hw_configs(self):
        _dir = os.path.dirname(os.path.realpath(__file__))
        root_dir = os.path.realpath(os.path.join(_dir, ".."))
        hw_dir = os.path.join(root_dir, "hw_configurations")
        for f in os.listdir(hw_dir):
            path = os.path.join(hw_dir, f)
            if f.endswith(".hwcfg"):
                cfg_name = os.path.splitext(f)[0]
                self.parse_hw_cfg(cfg_name, path)

    def parse_hw_cfg(self, cfg_name, cfg_path):
        self.hw_configurations[cfg_name] = {}
        self.hw_configurations[cfg_name]["path"] = cfg_path

        cfg = utils.load_status(cfg_path)
        for k, v in cfg.items():
            self.hw_configurations[cfg_name][k] = v

    def get_hw_config_names(self):
        return list(self.hw_configurations.keys())

    def get_hw_config_value(self, key):
        if not self.hw_config:
            raise ValueError("Active HW configuration not defined")
        return self.hw_configurations[self.hw_config].get(key)

    def get_hw_config_float_value(self, key):
        val = self.get_hw_config_value(key)
        return float(val)

    def get_hw_config_int_value(self, key):
        val = self.get_hw_config_value(key)
        return int(val)
