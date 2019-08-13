
import os
import utils

AUTO = "Automatic"
LEFT = "Left"
RIGHT = "Right"
TOP = "Top"
BOTTOM = "Bottom"
TOWER_POSITIONS = [AUTO, LEFT, RIGHT, TOP, BOTTOM]

LINES = [l for l in range(26)]
LINE_COUNT_DEFAULT = 6

# -1 is Auto
BRIM_SIZE = [2, 3, 4, 5, 6, 7, 8, 9, 10]
BRIM_DEFAULT = 3
BRIM_AUTO = "Auto"

INFILL_ZIGZAG = "ZigZag"
INFILL_BLOCKY = "Blocky"
INFILL_STYLES = [INFILL_ZIGZAG, INFILL_BLOCKY]


class Settings:

    HW_CFG_DIR = "hw_configurations"

    def __init__(self):
        self._hw_config = None
        self._purge_lines = LINE_COUNT_DEFAULT
        self._tower_position = None
        self._raft_multi = 100
        self._purge_multi = 110
        self._purge_speed = 60

        # speeds
        self._default_speed = None
        self._travel_xy_speed = None
        self._travel_z_speed = 1000
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
        self._linear_advance = 0
        self._pressure_advance = None

        # tower print settings
        self._brim = BRIM_DEFAULT
        self._brim_auto = False
        self._force_raft = None
        self._tower_force = []
        self._tower_fan_off = None
        self._infill_style = INFILL_ZIGZAG

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
    def tower_force(self):
        return self._tower_force

    @tower_force.setter
    def tower_force(self,value: str):
        self._tower_force = [int(x) for x in value.split(',')]
      
    @property
    def raft_multi(self):
        return self._raft_multi

    @raft_multi.setter
    def raft_multi(self, value):
        self._raft_multi = value

    @property
    def default_speed(self):
        if not self._default_speed:
            self._default_speed = self.get_hw_config_int_value("machine.default.speed")
        return self._default_speed

    @default_speed.setter
    def default_speed(self, value: float):
        self._default_speed = value

    @property
    def travel_xy_speed(self):
        if not self._travel_xy_speed:
            self._travel_xy_speed = self.get_hw_config_int_value("machine.xy.travel.speed")
        return self._travel_xy_speed

    @travel_xy_speed.setter
    def travel_xy_speed(self, value: float):
        self._travel_xy_speed = value

    @property
    def travel_z_speed(self):
        if not self._travel_z_speed:
            self._travel_z_speed = self.get_hw_config_int_value("machine.z.travel.speed")
        return self._travel_z_speed

    @travel_z_speed.setter
    def travel_z_speed(self, value: float):
        self._travel_z_speed = value

    @property
    def outer_perimeter_speed(self):
        if not self._outer_perimeter_speed:
            self._outer_perimeter_speed = self._default_speed
        return self._outer_perimeter_speed

    @outer_perimeter_speed.setter
    def outer_perimeter_speed(self, value: float):
        self._outer_perimeter_speed = value

    @property
    def first_layer_speed(self):
        if not self._first_layer_speed:
            self._first_layer_speed = self.default_speed/2
        return self._first_layer_speed

    @first_layer_speed.setter
    def first_layer_speed(self, value: float):
        self._first_layer_speed = value

    @property
    def machine_type(self):
        if not self._machine_type:
            self._machine_type = self.get_hw_config_int_value("machine.type")
        return self._machine_type

    @machine_type.setter
    def machine_type(self, value: int):
        # 0 is delta, 1 cartesian
        self._machine_type = value

    @property
    def stroke_x(self):
        if not self._stroke_x:
            self._stroke_x = self.get_hw_config_float_value("machine.x.length")
        return self._stroke_x

    @stroke_x.setter
    def stroke_x(self, value: float):
        self._stroke_x = value

    @property
    def stroke_y(self):
        if not self._stroke_y:
            self._stroke_y = self.get_hw_config_float_value("machine.y.length")
        return self._stroke_y

    @stroke_y.setter
    def stroke_y(self, value: float):
        self._stroke_y = value

    @property
    def origin_offset_x(self):
        if not self._origin_offset_x:
            self._origin_offset_x = self.get_hw_config_float_value("machine.origin.offset_x")
        return self._origin_offset_x

    @origin_offset_x.setter
    def origin_offset_x(self, value: float):
        self._origin_offset_x = value

    @property
    def origin_offset_y(self):
        if not self._origin_offset_y:
            self._origin_offset_y = self.get_hw_config_float_value("machine.origin.offset_y")
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
    def tower_fan_off(self):
        return self._tower_fan_off

    @tower_fan_off.setter
    def tower_fan_off(self, value: bool):
        self._tower_fan_off = value

    @property
    def infill_style(self):
        return self._infill_style

    @infill_style.setter
    def infill_style(self, value):
        if value not in INFILL_STYLES:
            raise ValueError("Unknown infill style {}".format(value))
        self._infill_style = value

    @property
    def extrusion_width(self):
        if not self._extrusion_width:
            self._extrusion_width = self.get_hw_config_float_value("tool.nozzle.diameter")
        return self._extrusion_width

    @extrusion_width.setter
    def extrusion_width(self, value: float):
        if value <= 0:
            raise ValueError("Extrusion width cannot be zero")
        self._extrusion_width = value

    @property
    def force_raft(self):
        return self._force_raft

    @force_raft.setter
    def force_raft(self, value: bool):
        self._force_raft = value

    @property
    def linear_advance(self):
        return self._linear_advance

    @linear_advance.setter
    def linear_advance(self, value: int):
        self._linear_advance = value

    @property
    def pressure_advance(self):
        return self._pressure_advance

    @pressure_advance.setter
    def pressure_advance(self, value: tuple):
        self._pressure_advance = value

    @property
    def purge_multi(self):
        return self._purge_multi

    @purge_multi.setter
    def purge_multi(self, value: int):
        self._purge_multi = value

    @property
    def purge_speed(self):
        return self._purge_speed

    @purge_speed.setter
    def purge_speed(self, value: int):
        self._purge_speed = value

    def read_hw_configs(self):
        _dir = os.path.dirname(os.path.realpath(__file__))
        root_dir = os.path.realpath(os.path.join(_dir, ".."))
        hw_dir = os.path.join(root_dir, self.HW_CFG_DIR)
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
        try:
            return float(val)
        except ValueError:
            raise ValueError("Cannot parse float value for key '{}'".format(key))

    def get_hw_config_int_value(self, key):
        val = self.get_hw_config_value(key)
        try:
            return int(val)
        except ValueError:
            raise ValueError("Cannot parse int value for key '{}'".format(key))

    def get_hw_config_bool_value(self, key):
        val = self.get_hw_config_value(key)
        try:
            return val.lower() == "true"
        except:
            pass
        return False

    def get_hw_config_array(self, key, _type):

        _key = key.replace("[]", "[{}]")

        values = []
        i = 0
        if _type == float:
            getter = self.get_hw_config_float_value
        elif _type == int:
            getter = self.get_hw_config_int_value
        elif _type == bool:
            getter = self.get_hw_config_bool_value
        else:
            getter = self.get_hw_config_value
        while True:
            try:
                val = getter(_key.format(i))
                values.append(val)
                i += 1
            except TypeError:
                break
        return values
