import pprint
import os
import unittest
from unittest.mock import MagicMock

import extruder
from gcode import GCode, E, W, S, N, NE, SE, NW, SW
from gcode_file import GCodeFile, Towers, Tower
from settings import Settings
from slicer_cura import CuraGCodeFile

from unittest_data import dummy_gcode
from unittest_data_Cura import pass1_testmodel1_Cura, pass1_testmodel1_retracts_Cura, pass2_testmodel1_towers_Cura, pass3_testmodel1_towers_Cura

prog_dir = os.path.dirname(os.path.realpath(__file__))


class TestGcode(unittest.TestCase):

    def setUp(self):
        self.test_object = GCode()

    def tearDown(self):
        pass

    def test_is_extruder_move(self):
        self.assertEqual((-2.5, 1500), self.test_object.is_extruder_move(b"G1 E-2.5 F1500"))
        self.assertEqual((-2.5, None), self.test_object.is_extruder_move(b"G1 E-2.5"))
        self.assertEqual((-3.0, 4800), self.test_object.is_extruder_move(b'G1 E-3.00000 F4800.00000'))
        self.assertEqual((-3.0, 4800), self.test_object.is_extruder_move(b'G1 F4800.00000 E-3.00000'))
        self.assertEqual((-2.6162, 1200), self.test_object.is_extruder_move(b'G1 F1200 E-2.6162'))
        self.assertEqual(None, self.test_object.is_extruder_move(b'G1 F4800.00000 E-3.00000 X0 Y0 Z0'))
        self.assertEqual((2.0, 2700), self.test_object.is_extruder_move(b"G1 F2700 E2"))

    def test_read_gcode_line(self):
        self.assertEqual((b"G1 E5 F1500  ", b" juu"), self.test_object.read_gcode_line(b"G1 E5 F1500  ; juu"))
        self.assertEqual((None, b" juu"), self.test_object.read_gcode_line(b"; juu"))
        self.assertEqual((None, b" juu ; joo"), self.test_object.read_gcode_line(b"; juu ; joo"))
        self.assertEqual((b"G1 E-3.00000 F4800.00000", None),
                         self.test_object.read_gcode_line(b"G1 E-3.00000 F4800.00000"))

    def test_format_to_string(self):
        self.assertEqual(b"G1 X1 Y1 Z1 E1 F1000; test",
                         self.test_object.format_to_string(b"G1 X1 Y1 Z1 E1 F1000", b" test"))
        self.assertEqual(b"G1 X1 Y1 Z1 E1 F1000",
                         self.test_object.format_to_string(b"G1 X1 Y1 Z1 E1 F1000", None))
        self.assertEqual(b"; test",
                         self.test_object.format_to_string(None, b" test"))

    def test_is_tool_change(self):
        self.assertEqual(0, self.test_object.is_tool_change(b"T0"))
        self.assertEqual(1, self.test_object.is_tool_change(b"T1"))
        self.assertEqual(1, self.test_object.is_tool_change(b"T1  ; tool 1"))

    def test_is_z_move(self):
        self.assertEqual((5.5, 1500), self.test_object.is_z_move(b"G1 Z5.500 F1500"))
        self.assertEqual((5.5, None), self.test_object.is_z_move(b"G1 Z5.500"))
        self.assertEqual(None, self.test_object.is_z_move(b"G1 X67.626 Y63.341 Z0.25 E0 F900"))

    def test_is_extrusion_move(self):
        self.assertEqual((80.349, 81.849, None, -2.5, None),
                         self.test_object.is_extrusion_move(b"G1 X80.349 Y81.849 E-2.5000"))
        self.assertEqual(None, self.test_object.is_extrusion_move(b"G1 X80.349 Y81.849 E0"))
        self.assertEqual((80.349, 81.849, None, 5, 2000),
                         self.test_object.is_extrusion_move(b"G1 X80.349 Y81.849 E5 F2000"))
        self.assertEqual((45.488, 56.304, 0.225, 1, 9000),
                        self.test_object.is_extrusion_move(b"G1 X45.488 Y56.304 Z0.225 E1 F9000"))

    def test_is_head_move(self):
        self.assertEqual((65.82, 76.532, 5.7, 1500), self.test_object.is_head_move(b"G1 X65.82 Y76.532 Z5.7 E0 F1500"))
        self.assertEqual((65.82, 76.532, None, 1500), self.test_object.is_head_move(b"G1 X65.82 Y76.532 F1500"))
        self.assertEqual((None, 76.532, None, 1500), self.test_object.is_head_move(b"G1 Y76.532 F1500"))
        self.assertEqual((65.82, None, None, 1500), self.test_object.is_head_move(b"G1 X65.82 F1500"))
        self.assertEqual((65.82, 76.532, None, 1500), self.test_object.is_head_move(b"G1 F1500 X65.82 Y76.532"))
        self.assertEqual((0.0, 10.0, 0.5, 5400.0), self.test_object.is_head_move(b"G0 F5400 X0.00 Y10 Z0.5"))
        self.assertEqual((45.488, 56.304, 0.225, 9000), self.test_object.is_head_move(b"G1 X45.488 Y56.304 Z0.225 E0 F9000"))

    def test_is_lin_advance(self):
        self.assertEqual(100, self.test_object.is_lin_advance(b"M900 K100"))
        self.assertEqual(0, self.test_object.is_lin_advance(b"M900 K0"))
        self.assertEqual(None, self.test_object.is_lin_advance(b"M900 Ko"))
        self.assertEqual(0.2, self.test_object.is_lin_advance(b"M900 K0.2"))

    def test_gen_lin_advance(self):
        self.assertEqual(b"M900 K100", self.test_object.gen_lin_advance(100))
        self.assertEqual(b"M900 K0.2", self.test_object.gen_lin_advance(0.2))

    def test_is_pressure_advance(self):
        self.assertEqual((b'0', 0.3), self.test_object.is_pressure_advance(b"M572 D0 S0.3"))
        self.assertEqual((b'0:1', 0.3), self.test_object.is_pressure_advance(b"M572 D0:1 S0.3"))
        self.assertEqual((b'0:1:2', 0.3), self.test_object.is_pressure_advance(b"M572 D0:1:2 S0.3"))
        self.assertEqual(None, self.test_object.is_pressure_advance(b"M572 D0:1:a S0.3"))

    def test_gen_direction_move(self):
        ret = self.test_object.gen_direction_move(E, 40, 3000, 0.1)
        expected = [b'G1 X40.000 Y0 F3000']
        for r in ret:
            self.assertEqual(expected[0], r)

    def test_gen_direction_move_with_e(self):
        e = extruder.Extruder(0)
        e.coasting = 0.2
        e.extrusion_width = 0.4

        ret = self.test_object.gen_direction_move(W, 40, 3000, 0.2, e)
        expected = [b'G1 X-40.000 Y0 E1.3304 F3000']
        for r in ret:
            self.assertEqual(expected[0], r)

        ret = self.test_object.gen_direction_move(S, 40, 3000, 0.1, e, last_line=True)
        expected = [b'G1 X0 Y-39.800 E0.6619 F3000', b'G1 X0 Y-0.200 F3000']
        for r in ret:
            self.assertEqual(expected[0], r)
            expected.pop(0)

    def test_get_coordinates(self):

        self.assertEqual((6.123233995736766e-16, 10.0), self.test_object._get_coordinates(N, 10))
        self.assertEqual((7.0710678118654755, 7.071067811865475), self.test_object._get_coordinates(NE, 10))
        self.assertEqual((10.0, 0.0), self.test_object._get_coordinates(E, 10))
        self.assertEqual((7.071067811865474, -7.071067811865477), self.test_object._get_coordinates(SE, 10))
        self.assertEqual((-1.8369701987210296e-15, -10.0), self.test_object._get_coordinates(S, 10))
        self.assertEqual((-7.071067811865477, -7.071067811865475), self.test_object._get_coordinates(SW, 10))
        self.assertEqual((-10.0, 1.2246467991473533e-15), self.test_object._get_coordinates(W, 10))
        self.assertEqual((-7.071067811865475, 7.0710678118654755), self.test_object._get_coordinates(NW, 10))
        self.assertEqual((8.660254037844387, 4.999999999999999), self.test_object._get_coordinates(30, 10))
        self.assertEqual((1.7364817766693041, 9.84807753012208), self.test_object._get_coordinates(80, 10))
        self.assertEqual((-1.736481776669303, 9.84807753012208), self.test_object._get_coordinates(100, 10))
        self.assertEqual((-9.396926207859085, -3.4202014332566866), self.test_object._get_coordinates(200, 10))
        self.assertEqual((9.702957262759965, -2.4192189559966786), self.test_object._get_coordinates(346, 10))

    def test_get_coordinates_by_offsets(self):
        self.assertEqual((11.0, 25.0), self.test_object.get_coordinates_by_offsets(0, 10, 10, 1, 15))
        self.assertEqual((10.738061598597138, 25.015167833783153), self.test_object.get_coordinates_by_offsets(1, 10, 10, 1, 15))
        self.assertEqual((6.999999999999998, 25.0), self.test_object.get_coordinates_by_offsets(0, 10, 10, -3, 15))
        self.assertEqual((4.440854075959419, 24.25117176218233), self.test_object.get_coordinates_by_offsets(10, 10, 10, -3, 15))
        self.assertEqual((11.795967328357486, 11.33210410834607), self.test_object.get_coordinates_by_offsets(10, 10, 10, 2, 1))
        self.assertEqual((6.408065343285028, 7.335791783307863), self.test_object.get_coordinates_by_offsets(10, 10, 10, -4, -2))
        self.assertEqual((8.724977204643308, 5.713472632617306), self.test_object.get_coordinates_by_offsets(10, 10, 10, -2, -4))
        self.assertEqual((12.664208216692137, 6.408065343285028), self.test_object.get_coordinates_by_offsets(10, 10, 10, 2, -4))

    def test_is_temp_nowait(self):
        self.assertEqual((255,), self.test_object.is_temp_nowait(b"M104 S255"))
        self.assertEqual((255, 0), self.test_object.is_temp_nowait_tool(b"M104 S255  T0"))

    def test_is_temp_wait(self):
        self.assertEqual((255,), self.test_object.is_temp_wait(b"M109 S255"))
        self.assertEqual((255, 0), self.test_object.is_temp_wait_tool(b"M109 S255 T0"))

    def test_is_fan_speed(self):
        self.assertEqual(255, self.test_object.is_fan_speed(b"M106 S255"))

    def test_opposite_dir(self):
        self.assertEqual(180, self.test_object.opposite_dir(E))
        self.assertEqual(0, self.test_object.opposite_dir(W))
        self.assertEqual(90, self.test_object.opposite_dir(S))
        self.assertEqual(270, self.test_object.opposite_dir(N))

        self.assertEqual(90, self.test_object.opposite_dir(E + 270))
        self.assertEqual(270, self.test_object.opposite_dir(W + 270))
        self.assertEqual(360, self.test_object.opposite_dir(S + 270))
        self.assertEqual(180, self.test_object.opposite_dir(N + 270))

    def test_rotate(self):
        self.assertEqual(90, self.test_object.rotate(W, 270))


class TestGcodeFile(unittest.TestCase):

    def setUp(self):
        self.test_files_dir = os.path.join(prog_dir, 'test_data')
        self.settings = Settings()
        self.logger = MagicMock()

    def test_open_file(self):
        gcode = GCodeFile(self.logger, self.settings)
        gcode.open_file(os.path.join(self.test_files_dir, "dummy.gcode"))
        self.assertEqual(dummy_gcode, gcode.lines)

    def test_add_line(self):

        def get_generator_lines():
            yield (b"test-cmd2", b"test-comment2")
            yield (b"test-cmd3", b"test-comment3")

        def get_generator_lines2():
            yield b"test-cmd4"
            yield b"test-cmd5"

        gcode = GCodeFile(self.logger, self.settings)
        self.assertEqual(None, gcode.lines)
        gcode.lines = []
        ret = gcode.add_line(b"test-cmd", b"test-comment")
        self.assertEqual(1, ret)
        self.assertEqual([(b"test-cmd", b"test-comment")], gcode.lines)
        ret = gcode.add_line(get_generator_lines())
        self.assertEqual(2, ret)
        self.assertEqual([(b"test-cmd", b"test-comment"),
                          (b"test-cmd2", b"test-comment2"),
                          (b"test-cmd3", b"test-comment3")], gcode.lines)

        gcode.add_line(get_generator_lines2(), b"test")
        self.assertEqual([(b"test-cmd", b"test-comment"),
                          (b"test-cmd2", b"test-comment2"),
                          (b"test-cmd3", b"test-comment3"),
                          (b"test-cmd4", b"test"),
                          (b"test-cmd5", b"test")], gcode.lines)

    def test_insert_line(self):

        def get_generator_lines():
            yield (b"test-cmd7", b"test-comment7")
            yield (b"test-cmd8", b"test-comment8")

        def get_generator_lines2():
            yield b"test-cmd9"
            yield b"test-cmd10"

        gcode = GCodeFile(self.logger, self.settings)
        self.assertEqual(None, gcode.lines)
        gcode.lines = [(b"test-cmd", b"test-comment"),
                        (b"test-cmd2", b"test-comment2"),
                        (b"test-cmd3", b"test-comment3"),
                        (b"test-cmd4", b"test"),
                        (b"test-cmd5", b"test")]
        ret = gcode.insert_line(3, b"test-cmd6", b"test-comment6")
        self.assertEqual(1, ret)
        self.assertEqual([(b"test-cmd", b"test-comment"),
                          (b"test-cmd2", b"test-comment2"),
                          (b"test-cmd3", b"test-comment3"),
                          (b"test-cmd6", b"test-comment6"),
                          (b"test-cmd4", b"test"),
                          (b"test-cmd5", b"test")], gcode.lines)
        ret = gcode.insert_line(2, get_generator_lines())
        self.assertEqual(2, ret)
        self.assertEqual([(b"test-cmd", b"test-comment"),
                          (b"test-cmd2", b"test-comment2"),
                          (b"test-cmd7", b"test-comment7"),
                          (b"test-cmd8", b"test-comment8"),
                          (b"test-cmd3", b"test-comment3"),
                          (b"test-cmd6", b"test-comment6"),
                          (b"test-cmd4", b"test"),
                          (b"test-cmd5", b"test")], gcode.lines)
        ret = gcode.insert_line(4, get_generator_lines2(), b"test")
        self.assertEqual(2, ret)
        self.assertEqual([(b"test-cmd", b"test-comment"),
                          (b"test-cmd2", b"test-comment2"),
                          (b"test-cmd7", b"test-comment7"),
                          (b"test-cmd8", b"test-comment8"),
                          (b"test-cmd9", b"test"),
                          (b"test-cmd10", b"test"),
                          (b"test-cmd3", b"test-comment3"),
                          (b"test-cmd6", b"test-comment6"),
                          (b"test-cmd4", b"test"),
                          (b"test-cmd5", b"test")], gcode.lines)


class TestCuraGcodeFile(unittest.TestCase):

    def setUp(self):
        self.test_files_dir = os.path.join(prog_dir, 'test_data')
        self.settings = Settings()
        self.settings.hw_config = "Prometheus-PTFE-PRO-12"
        self.logger = MagicMock()

    def test_parse_version(self):
        gcode = CuraGCodeFile(self.logger, self.settings)
        gcode.open_file(os.path.join(self.test_files_dir, "mc_testmodel1_Cura.gcode"))
        gcode.parse_version()
        self.assertEqual(gcode.version, (3, 5, 1))

    def test_parse_gcode_pass1_Cura_testmodel1(self):
        gcode = CuraGCodeFile(self.logger, self.settings)
        gcode.open_file(os.path.join(self.test_files_dir, "mc_testmodel1_Cura.gcode"))
        gcode.parse_gcode_pass1()
        self.assertEqual(130, len(gcode._layers))
        self.assertEqual(pass1_testmodel1_Cura, gcode._layers)
        self.assertEqual(pass1_testmodel1_retracts_Cura, gcode._retracts)
        self.assertEqual(4, len(gcode.extruders))

        data = [(1.9,2400),
                (6.5, 1500),
                (6.5, 1500),
                (6.5, 1500)]

        index = 0
        for d in data:
            self.assertEqual(0.4, gcode.extruders[index].nozzle)
            self.assertEqual(0.5, gcode.extruders[index].z_hop)
            self.assertEqual(d[0], gcode.extruders[index].retract)
            self.assertEqual(d[1], gcode.extruders[index].retract_speed)
            index += 1

        self.assertEqual([0, 1, 2, 3], list(gcode.extruders.keys()))
        self.assertEqual(26.1, gcode.last_switch_height)
        self.assertEqual(18, gcode.start_gcode_end)

    def test_parse_gcode_pass2_Cura_testmodel1(self):
        gcode = CuraGCodeFile(self.logger, self.settings)
        gcode.open_file(os.path.join(self.test_files_dir, "mc_testmodel1_Cura.gcode"))
        gcode.parse_gcode_pass1()
        gcode.parse_gcode_pass2()
        self.assertEqual(len(pass2_testmodel1_towers_Cura), gcode.towers.get_max_tower_count())

        index = 0
        for data in pass2_testmodel1_towers_Cura:
            self.assertEqual(data, gcode.towers.get_tower_by_id(index).z)
            index += 1

    def test_parse_gcode_pass3_Cura_testmodel1(self):
        gcode = CuraGCodeFile(self.logger, self.settings)
        gcode.open_file(os.path.join(self.test_files_dir, "mc_testmodel1_Cura.gcode"))
        gcode.parse_gcode_pass1()
        gcode.parse_gcode_pass2()
        gcode.parse_gcode_pass3()
        index = 0
        for data in pass3_testmodel1_towers_Cura:
            self.assertEqual(data, gcode.towers.get_tower_by_id(index).z)
            index += 1
        self.assertEqual(0.2, gcode.towers.get_tower_by_id(0).min_z)
        self.assertEqual(0.2, gcode.towers.get_tower_by_id(1).min_z)
        self.assertEqual(0.2, gcode.towers.get_tower_by_id(2).min_z)

    def test_find_model_limits(self):
        gcode = CuraGCodeFile(self.logger, self.settings)
        gcode.open_file(os.path.join(self.test_files_dir, "mc_testmodel1_Cura.gcode"))
        gcode.parse_gcode()
        gcode.find_model_limits()
        self.assertEqual(93.5, gcode.x_max)
        self.assertEqual(51.5, gcode.x_min)
        self.assertEqual(95.0, gcode.y_max)
        self.assertEqual(53.0, gcode.y_min)


class TestTowers(unittest.TestCase):

    def setUp(self):
        towers = []
        for i in pass3_testmodel1_towers_Cura:
            t = Tower()
            for k, v in i.items():
                t.add(k, v)
            towers.append(t)
        self.towers = Towers()
        self.towers.add_tower(0, towers[0])
        self.towers.add_tower(1, towers[1])
        self.towers.add_tower(2, towers[2])

    def tearDown(self):
        pass

    def test_tower_calculate_min_z(self):
        tower = Tower()
        test_data = {0.3: 1,
                     0.4: 0,
                     0.5: 1,
                     0.65: 0,
                     0.75: 1,
                     0.9: 0}
        for k, v in test_data.items():
            tower.add(k, v)

        self.assertEqual(test_data, tower.z)
        self.assertEqual(0.1, tower.min_z)

    def test_towers_get_tower_count(self):
        self.assertEqual(3, self.towers.get_tower_count(0.3))
        self.assertEqual(3, self.towers.get_tower_count(2.1))
        self.assertEqual(1, self.towers.get_tower_count(3.3))
        self.assertEqual(0, self.towers.get_tower_count(26.3))

    def test_towers_get_min_layer_h(self):
        self.assertEqual(0.2, self.towers.get_min_layer_h())

    def test_towers_fill_gaps(self):
        towers = Towers()
        index = 0
        for i in pass2_testmodel1_towers_Cura:
            t = Tower()
            for k, v in i.items():
                t.add(k, v)
            towers.add_tower(index, t)
            index += 1
        towers.fill_gaps(0.25,pass1_testmodel1_Cura)
        for i in range(index):
            self.assertEqual(towers.get_tower_by_id(i).z, pass3_testmodel1_towers_Cura[i])

    def test_towers_get_max_tower_count(self):
        self.assertEqual(3, self.towers.get_max_tower_count())

    def test_towers_get_tower_id_by_z_and_tool(self):
        self.assertEqual(0, self.towers.get_tower_id_by_z_and_tool(0.3, 1))
        self.assertEqual(0, self.towers.get_tower_id_by_z_and_tool(0.7, 0))
        self.assertEqual(None, self.towers.get_tower_id_by_z_and_tool(0.7, 1))
        self.assertEqual(0, self.towers.get_tower_id_by_z_and_tool(11.9, 3))
        self.assertEqual(2, self.towers.get_tower_id_by_z_and_tool(2.3, 3))


class TestSettings(unittest.TestCase):

    def setUp(self):
        Settings.HW_CFG_DIR = "src/test_data/hwcfg"
        self.settings = Settings()
        self.settings.hw_config = "testcfg"

    def test_get_hw_config_array(self):

        result = self.settings.get_hw_config_array("rapid.retract.initial[].length", _type=float)
        self.assertEqual(result, [20.0, 15.0])

    def test_get_hw_config_bool_value(self):

        result = self.settings.get_hw_config_bool_value("prerun.prime")
        self.assertFalse(result)

        # TODO: should this raise exception?
        result = self.settings.get_hw_config_bool_value("does.not.exist")
        self.assertFalse(result)


if __name__ == "__main__":
    unittest.main()
