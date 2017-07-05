from gcode import GCode


gcode = GCode()

# hw configs
PEEK = "PEEK"
PTFE = "PTFE"
E3DV6 = "E3DV6"

HW_CONFIGS = [PTFE, E3DV6, PEEK]

class SwitchTower:

    def __init__(self, start_pos_x, start_pos_y, logger, hw_config):
        """
        Filament switc tower functionality
        :param start_pos_x: start position x coordinate
        :param start_pos_y: start position y coordinate
        :param logger: Logger object
        :param config: system configuration (PEEK, PTFE, E3Dv6)
        """

        self.log = logger

        self.width = 50
        self.height = 14 # use even values

        self.hw_config = hw_config
        if self.hw_config == E3DV6:
            self.height += 1

        self.raft_width = self.width + 4
        self.raft_height = self.height + 2
        self.angle = 0
        self.start_pos_x = start_pos_x
        self.start_pos_y = start_pos_y
        self.raft_pos_x = self.start_pos_x - 1
        self.raft_pos_y = self.start_pos_y - 1
        self.last_tower_z = 0

        self.flipflop_purge = False
        self.flipflop_infill = False

        # is prepurge position positive or negative
        self.prepurge_sign = 1

        self.pre_switch_lines = {}
        self.post_switch_lines = []

        self.init_pre_switch_gcode()
        self.init_post_switch_gcode()


    def init_pre_switch_gcode(self):
        # TODO: read from file
        self.pre_switch_lines[True] = []
        self.pre_switch_lines[False] = []

        if self.hw_config == PEEK:
            # flip

            prepurge_feed_rate = lambda x: x * (4.5 / 50)
            prepurge_feed_length = prepurge_feed_rate(self.width)

            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y0.9 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y0.6 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y1.4 F3000", b" Y shift"))

            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F1500" % (10, -20)).encode(), b" drip trail"))
            self.pre_switch_lines[True].append((b"G1 E-15 F1500", b" 25mm/s reshaping"))
            self.pre_switch_lines[True].append((b"G4 P2000", b" 2s cooling period"))
            self.pre_switch_lines[True].append((b"G1 E-95 F1500", b" 25mm/s long retract"))

            # flop
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y0.6 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y0.6 F3000", b" Y shift"))

            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F1500" % (10, -20)).encode(), b" drip trail"))
            self.pre_switch_lines[False].append((b"G1 E-15 F1500", b" 25mm/s reshaping"))
            self.pre_switch_lines[False].append((b"G4 P2000", b" 2s cooling period"))
            self.pre_switch_lines[False].append((b"G1 E-95 F1500", b" 25mm/s long retract"))

        elif self.hw_config == PTFE:

            prepurge_feed_rate = lambda x: x * (4.5 / 50)
            prepurge_feed_length = prepurge_feed_rate(self.width)

            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y0.9 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y0.6 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y1.4 F3000", b" Y shift"))

            self.pre_switch_lines[True].append((b"G1 E-20 F3000", b" rapid retract"))
            self.pre_switch_lines[True].append((b"G4 P2500", b" 2.5s cooling period"))
            self.pre_switch_lines[True].append((b"G1 E-140 F3000", b" 50mm/s long retract"))

            # flop
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y0.6 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y0.6 F3000", b" Y shift"))

            self.pre_switch_lines[False].append((b"G1 E-20 F3000", b" rapid retract"))
            self.pre_switch_lines[False].append((b"G4 P2500", b" 2.5s cooling period"))
            self.pre_switch_lines[False].append((b"G1 E-140 F3000", b" 50mm/s long retract"))

        elif self.hw_config == E3DV6:

            prepurge_feed_rate = lambda x: x * (4.5 / 50)
            prepurge_feed_length = prepurge_feed_rate(self.width)

            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y0.9 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y0.6 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[True].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[True].append((b"G1 Y1.4 F3000", b" Y shift"))

            self.pre_switch_lines[True].append((b"G1 E-20 F3000", b" rapid retract"))
            self.pre_switch_lines[True].append((b"G4 P2500", b" 2.5s cooling period"))
            self.pre_switch_lines[True].append((b"G1 E-140 F3000", b" 50mm/s long retract"))

            # flop
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y0.6 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y1.4 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (-self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y0.6 F3000", b" Y shift"))
            self.pre_switch_lines[False].append((("G1 X%.3f E%.4f F6000" % (self.width, prepurge_feed_length)).encode(), b" purge trail"))
            self.pre_switch_lines[False].append((b"G1 Y0.6 F3000", b" Y shift"))

            self.pre_switch_lines[False].append((b"G1 E-20 F3000", b" rapid retract"))
            self.pre_switch_lines[False].append((b"G4 P2500", b" 2.5s cooling period"))
            self.pre_switch_lines[False].append((b"G1 E-140 F3000", b" 50mm/s long retract"))

    def init_post_switch_gcode(self):
        # TODO: read from file
        if self.hw_config == PEEK:
            primetrail_feed_rate = lambda x: x * (1.6 / 40)
            primetrail_length = primetrail_feed_rate(self.width)

            self.post_switch_lines.append((b"G1 E125 F1500", b" 25mm/s feed"))
            self.post_switch_lines.append((("G1 X%.3f E%.4f F1500" % (self.width - 10, primetrail_length)).encode(), b" prime trail"))
            self.prepurge_sign = 1
        elif self.hw_config == PTFE:
            primetrail_feed_rate = lambda x: x * (5 / 50)
            primetrail_length = primetrail_feed_rate(self.width)

            self.post_switch_lines.append((b"G1 E100 F3000", b" 50mm/s feed"))
            self.post_switch_lines.append((b"G1 E54 F1500", b" 25mm/s feed"))
            self.post_switch_lines.append((("G1 X%.3f E%.4f F900" % (self.width, primetrail_length)).encode(), b" prime trail"))
            self.prepurge_sign = 1

        elif self.hw_config == E3DV6:
            primetrail_feed_rate = lambda x: x * (5 / 50)
            primetrail_length = primetrail_feed_rate(self.width)

            self.post_switch_lines.append((b"G1 E100 F3000", b" 50mm/s feed"))
            self.post_switch_lines.append((b"G1 E54 F1500", b" 25mm/s feed"))
            self.post_switch_lines.append((("G1 X%.3f E%.4f F900" % (-self.width, primetrail_length)).encode(), b" prime trail"))
            self.prepurge_sign = -1

    def get_raft_lines(self, first_extruder, retract):
        """
        G-code lines for the raft
        :param first_extruder: first extruder object
        :param retract: to retract or not
        :return: list of cmd, comment tuples
        """
        yield None, b" TOWER RAFT START"
        if first_extruder.z_hop:
            z_hop = 0.2 + first_extruder.z_hop
            yield ("G1 Z%.3f F2000" % z_hop).encode(), b" z-hop"
        yield ("G1 X%.3f Y%.3f F9000" % (self.raft_pos_x, self.raft_pos_y)).encode(), b" move to purge zone"
        yield b"G1 Z0.2 F1500", b" move z close"
        yield b"G91", b" relative positioning"

        # box
        yield ("G1 X%.3f E%.4f F2000" % (self.raft_width, first_extruder.get_feed_length(self.raft_width))).encode(), b" purge wall"
        yield ("G1 Y%.3f E%.4f F2000" % (self.raft_height+0.2, first_extruder.get_feed_length(self.raft_height+0.2))).encode(), b" Y shift"
        yield ("G1 X%.3f E%.4f F2000" % (-self.raft_width, first_extruder.get_feed_length(self.raft_width))).encode(), b" purge wall"
        yield ("G1 Y%.3f E%.4f F2000" % (-(self.raft_height-0.3), first_extruder.get_feed_length(self.raft_height-0.3))).encode(), b" Y shift"

        yield b"G1 X0.2 Y-0.4 F2000", None

        raft_feed = first_extruder.get_feed_length(self.raft_height) * 1.3
        for _ in range(int(self.raft_width/2)):
            yield ("G1 X1 Y%.3f E%.4f F1000" % (self.raft_height, raft_feed)).encode(), b" raft1"
            yield b"G1 X1 F1000", b" raft2"
            yield ("G1 X-1 Y%.3f E%.4f F1000" % (-self.raft_height, raft_feed)).encode(), b" raft3"
            yield b"G1 X1 F1000", b" raft4"

        if retract:
            yield first_extruder.get_retract_gcode()
        yield b"G90", b" absolute positioning"
        yield None, b" TOWER RAFT END"
        self.last_tower_z = 0.2

    def _get_z_hop(self, layer, z_hop, z_speed, extruder):
        """
        Get g-code for z-hop
        :param layer: current layer
        :param z-hop position
        :param z_speed: z-axis speed
        :param extruder: current extruder
        :return: G-code for z-hop or None
        """
        if extruder.z_hop:
            new_z_hop = self.last_tower_z + extruder.z_hop
            if new_z_hop != layer.z + z_hop:
                return ("G1 Z%.3f F%.1f" % (new_z_hop, z_speed)).encode(), b" z-hop"
        return None

    def _get_retraction(self, e_pos, extruder):
        """
        Get g-code for retraction. Calculate needed retraction length from current e position
        :param e_pos: extruder position
        :param extruder: extruder object
        :return: retraction g-code
        """
        retraction = extruder.retract + e_pos
        self.log.debug("Retraction to add: %s. E position: %s" %(retraction, e_pos))
        if retraction > 0.00001:
            if retraction > extruder.retract:
                retraction = extruder.retract
            return ("G1 E%.4f F%.1f" % (-retraction, extruder.retract_speed)).encode(), b" tower retract"

    def get_tower_lines(self, layer, e_pos, old_e, new_e, z_hop, z_speed):
        """
        G-code for switch tower
        :param layer: current layer
        :param e_pos: extruder position
        :param old_e: old extruder
        :param new_e: new extruder
        :param z_hop: z_hop position
        :param z_speed: z axis speed
        :return: list of cmd, comment tuples
        """
        self.log.debug("Adding purge tower")
        yield None, b" TOWER START"

        # handle retraction
        retraction = self._get_retraction(e_pos, old_e)
        if retraction:
            yield retraction

        # handle z-hop
        hop = self._get_z_hop(layer, z_hop, z_speed, old_e)
        if hop:
            yield hop

        self.last_tower_z = self.last_tower_z + layer.height
        if self.flipflop_purge:
            yield ("G1 X%.3f Y%.3f F9000" % (self.start_pos_x-0.6, self.start_pos_y+0.2)).encode(), b" move to purge zone"
        else:
            yield ("G1 X%.3f Y%.3f F9000" % (self.start_pos_x+0.6, self.start_pos_y)).encode(), b" move to purge zone"
        yield ("G1 Z%.3f F%.1f" % (self.last_tower_z, z_speed)).encode(), b" move z close"
        yield b"G91", b" relative positioning"
        yield old_e.get_prime_gcode(change=-0.1)

        ## pre-switch purge
        for line in self.pre_switch_lines[self.flipflop_purge]:
            yield line

        yield ("T%s" % new_e.tool).encode(), b" change tool"

        ## feed new filament
        for line in self.post_switch_lines:
            yield line

        ## post-switch purge
        purge_line_length = self.width + 0.6
        purge_lines = int((self.height)/2)-1
        purge_x_feed = abs(new_e.get_feed_length(purge_line_length)*1.3)
        # switch direction depending of prepurge orientation
        purge_line_length *= self.prepurge_sign
        for _ in range(purge_lines):
            if self.flipflop_purge:
                yield b"G1 Y0.6 F3000", b" Y shift"
                yield ("G1 X%.3f E%.4f F3000" % (-purge_line_length, purge_x_feed)).encode(), b" purge trail"
                yield b"G1 Y0.9 F3000", b" Y shift"
                yield ("G1 X%.3f E%.4f F3000" % (purge_line_length, purge_x_feed)).encode(), b" purge trail"
            else:
                yield b"G1 Y0.9 F3000", b" Y shift"
                yield ("G1 X%.3f E%.4f F3000" % (-purge_line_length, purge_x_feed)).encode(), b" purge trail"
                yield b"G1 Y0.6 F3000", b" Y shift"
                yield ("G1 X%.3f E%.4f F3000" % (purge_line_length, purge_x_feed)).encode(), b" purge trail"

        # wipe line. also switch direction
        wipe_line_length = purge_line_length - self.prepurge_sign * 0.4

        if self.flipflop_purge:
            yield b"G0.5 Y1 F3000", b" Y shift"
        else:
            yield b"G1 Y1 F3000", b" Y shift"
        yield ("G1 X%.3f E%.4f F3000" % (-wipe_line_length, new_e.get_feed_length(wipe_line_length))).encode(), b" purge trail"
        yield b"G1 X-0.2 F3000", b" wipe"
        yield new_e.get_retract_gcode()
        yield b"G1 X-0.2 F3000", b" wipe"
        yield b"G1 X4 F3000", b" wipe"

        yield b"G90", b" absolute positioning"
        yield b"G92 E0", b" reset extruder position"
        hop = self._get_z_hop(layer, z_hop, z_speed, old_e)
        if hop:
            yield hop
        yield None, b" TOWER END"

        self.flipflop_purge = not self.flipflop_purge

    def get_infill_lines(self, layer, e_pos, extruder, z_hop, z_speed):
        """
        G-code for switch tower infill
        :param layer: current layer
        :param e_pos: extruder position
        :param extruder: active extruder
        :param z_hop: z_hop position
        :param z_speed: z axis speed
        :return: list of cmd, comment tuples
        """
        self.log.debug("Adding purge tower infill")
        yield None, b" TOWER INFILL START"

        ## handle retraction
        retraction = self._get_retraction(e_pos, extruder)
        if retraction:
            yield retraction

        ## handle z-hop
        hop = self._get_z_hop(layer, z_hop, z_speed, extruder)
        if hop:
            yield hop

        self.last_tower_z = self.last_tower_z + layer.height
        if self.flipflop_infill:
            yield ("G1 X%.3f Y%.3f F9000" % (self.start_pos_x, self.start_pos_y)).encode(), b" move to purge zone"
        else:
            yield ("G1 X%.3f Y%.3f F9000" % (self.start_pos_x, self.start_pos_y+self.height)).encode(), b" move to purge zone"
        yield ("G1 Z%.3f F%.1f" % (self.last_tower_z, z_speed)).encode(), b" move z close"
        yield b"G91", b" relative positioning"
        yield extruder.get_prime_gcode()

        ## infill
        infill_x = self.width/5
        infill_y = self.height-0.3
        infill_path_length = gcode.calculate_path_length((0,0), (infill_x, infill_y))
        infill_length = extruder.get_feed_length(infill_path_length)

        if self.flipflop_infill:
            yield ("G1 X%.3f E%.4f F3000" % (self.width, extruder.get_feed_length(self.width))).encode(), b" purge wall"
            yield ("G1 Y%.3f E%.4f F3000" % (self.height, extruder.get_feed_length(self.height))).encode(), b" Y shift"
            yield ("G1 X%.3f E%.4f F3000" % (-self.width, extruder.get_feed_length(self.width))).encode(), b" purge wall"
            yield ("G1 Y%.3f E%.4f F3000" % (-infill_y, extruder.get_feed_length(infill_y))).encode(), b" Y shift"
            flip = True
        else:
            yield ("G1 X%.3f E%.4f F3000" % (self.width, extruder.get_feed_length(self.width))).encode(), b" purge wall"
            yield ("G1 Y%.3f E%.4f F3000" % (-self.height, extruder.get_feed_length(self.height))).encode(), b" Y shift"
            yield ("G1 X%.3f E%.4f F3000" % (-self.width, extruder.get_feed_length(self.width))).encode(), b" purge wall"
            yield ("G1 Y%.3f E%.4f F3000" % (infill_y, extruder.get_feed_length(infill_y))).encode(), b" Y shift"
            flip = False

        for _ in range(5):
            if flip:
                yield ("G1 X%.3f Y%s E%.4f F3000" % (infill_x, infill_y, infill_length)).encode(), b" infill"
            else:
                yield ("G1 X%.3f Y%s E%.4f F3000" % (infill_x, -infill_y, infill_length)).encode(), b" infill"
            flip = not flip

        if self.flipflop_infill:
            yield b"G1 Y0.2 F3000", b" wipe"
        else:
            yield b"G1 Y-0.2 F3000", b" wipe"

        yield extruder.get_retract_gcode()

        if self.flipflop_infill:
            yield b"G1 Y1 F3000", b" wipe"
        else:
            yield b"G1 Y-1 F3000", b" wipe"

        yield b"G90", b" absolute positioning"
        hop = self._get_z_hop(layer, z_hop, z_speed, extruder)
        if hop:
            yield hop
        yield b"G92 E0", b" reset extruder position"
        yield None, b" TOWER INFILL END"

        self.flipflop_infill = not self.flipflop_infill