
import unittest

import extruder
from gcode import GCode, E, W, S, N, NE, SE, NW, SW


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
        self.assertEqual(None, self.test_object.is_extruder_move(b'G1 F4800.00000 E-3.00000 X0 Y0 Z0'))

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

    def test_is_head_move(self):
        self.assertEqual((65.82, 76.532, 5.7, 1500), self.test_object.is_head_move(b"G1 X65.82 Y76.532 Z5.7 E0 F1500"))
        self.assertEqual((65.82, 76.532, None, 1500), self.test_object.is_head_move(b"G1 X65.82 Y76.532 F1500"))
        self.assertEqual((None, 76.532, None, 1500), self.test_object.is_head_move(b"G1 Y76.532 F1500"))
        self.assertEqual((65.82, None, None, 1500), self.test_object.is_head_move(b"G1 X65.82 F1500"))
        self.assertEqual((65.82, 76.532, None, 1500), self.test_object.is_head_move(b"G1 F1500 X65.82 Y76.532"))

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
        self.assertEqual(255, self.test_object.is_temp_nowait(b"M104 S255"))
        self.assertEqual((255, 0), self.test_object.is_temp_nowait_tool(b"M104 S255  T0"))

    def test_is_temp_wait(self):
        self.assertEqual(255, self.test_object.is_temp_wait(b"M109 S255"))
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

