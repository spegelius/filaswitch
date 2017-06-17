
class SwitchTower:

    def __init__(self, start_pos_x, start_pos_y):
        self.width = 50
        self.height = 15
        self.raft_width = self.width + 4
        self.raft_height = self.height + 2
        self.angle = 0
        self.start_pos_x = start_pos_x
        self.start_pos_y = start_pos_y
        self.raft_pos_x = self.start_pos_x - 1
        self.raft_pos_y = self.start_pos_y - 1
        self.last_tower_z = 0

        self.flipflop = False

        self.prepurge_feed_rate = lambda x: x*(4.5/50)
        self.prepurge_feed_length = self.prepurge_feed_rate(self.width)

    def get_raft_lines(self, first_extruder, retract):
        """
        G-code lines for the raft
        :param first_extruder: first extruder object
        :param retract: to retract or not
        :return: list of cmd, comment tuples
        """
        yield None, b"TOWER RAFT START"
        if first_extruder.z_hop:
            z_hop = 0.2 + first_extruder.z_hop
            yield ("G1 Z%.3f F2000" % z_hop).encode(), b"z-hop"
        yield ("G1 X%.3f Y%.3f F9000" % (self.raft_pos_x, self.raft_pos_y)).encode(), b"move to purge zone"
        yield b"G1 Z0.2 F1500", b"move z close"
        yield b"G91", b"relative positioning"

        for _ in range(int(self.raft_width/2)):
            yield ("G1 X1 Y%.3f E0.65 F1000" % self.raft_height).encode(), b"raft1"
            yield b"G1 X1 F1000", b"raft2"
            yield ("G1 X-1 Y-%.3f E0.65 F1000" % self.raft_height).encode(), b"raft3"
            yield b"G1 X1 F1000", b"raft4"

        if retract:
            yield ("G1 E-%.2f F%.1f" % (first_extruder.retract, first_extruder.retract_speed)).encode(), b"retract"
        yield b"G90", b"absolute positioning"
        yield None, b"TOWER RAFT END"
        self.last_tower_z = 0.2

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
        self.last_tower_z = self.last_tower_z + layer.height
        yield None, b"TOWER START"

        retraction = e_pos - old_e.retract
        print(retraction, e_pos)
        if retraction:
            yield ("G1 E%s F%.1f" % (retraction, old_e.retract_speed)).encode(), b"retract"
        if not z_hop:
            z_hop = layer.z + old_e.z_hop
            yield ("G1 Z%.3f F%.1f" % (z_hop, z_speed)).encode(), b"z-hop"
        if self.flipflop:
            yield ("G1 X%.3f Y%.3f F9000" % (self.start_pos_x-0.5, self.start_pos_y)).encode(), b"move to purge zone"
        else:
            yield ("G1 X%.3f Y%.3f F9000" % (self.start_pos_x, self.start_pos_y-0.5)).encode(), b"move to purge zone"
        yield ("G1 Z%.3f F%.1f" % (self.last_tower_z, z_speed)).encode(), b"move z close"
        yield b"G91", b"relative positioning"

        ## prepurge
        if self.flipflop:
            yield ("G1 E%.3f F4800" % old_e.retract).encode(), b"prime"
            yield ("G1 X%.3f E%.4f F6000" % (self.width, self.prepurge_feed_length)).encode(), b"purge trail"
            yield b"G1 Y0.6 F3000", b"Y shift"
            yield ("G1 X%.3f E%.4f F6000" % (-self.width, self.prepurge_feed_length)).encode(), b"purge trail"
            yield b"G1 Y1 F3000", b"Y shift"
            yield ("G1 X%.3f E%.4f F6000" % (self.width, self.prepurge_feed_length)).encode(), b"purge trail"
            yield b"G1 Y0.6 F3000", b"Y shift"
            yield ("G1 X%.3f E%.4f F6000" % (-self.width, self.prepurge_feed_length)).encode(), b"purge trail"
            yield b"G1 Y1 F3000", b"Y shift"
            yield ("G1 X%.3f E%.4f F1500" % (10, -20)).encode(), b"drip trail"
            yield b"G1 E-15 F1500", b"25mm/s reshaping"
            yield b"G4 P2000", b"2s cooling period"
            yield b"G1 E-95 F1500", b"25mm/s long retract"
        else:
            yield ("G1 E%s F4800" % old_e.retract).encode(), b"prime"
            yield ("G1 X%.3f E%.4f F6000" % (self.width, self.prepurge_feed_length)).encode(), b"purge trail"
            yield b"G1 Y1 F3000", b"Y shift"
            yield ("G1 X%.3f E%.4f F6000" % (-self.width, self.prepurge_feed_length)).encode(), b"purge trail"
            yield b"G1 Y0.6 F3000", b"Y shift"
            yield ("G1 X%.3f E%.4f F6000" % (self.width, self.prepurge_feed_length)).encode(), b"purge trail"
            yield b"G1 Y1 F3000", b"Y shift"
            yield ("G1 X%.3f E%.4f F6000" % (-self.width, self.prepurge_feed_length)).encode(), b"purge trail"
            yield b"G1 Y0.6 F3000", b"Y shift"
            yield ("G1 X%.3f E%.4f F1500" % (10, -20)).encode(), b"drip trail"
            yield b"G1 E-15 F1500", b"25mm/s reshaping"
            yield b"G4 P2000", b"2s cooling period"
            yield b"G1 E-95 F1500", b"25mm/s long retract"

        yield ("T%s" % new_e.tool).encode(), b"change tool"

        ## feed new filament
        yield b"G1 E123 F1500", b"25mm/s feed"
        yield ("G1 X%.3f E%.4f F1500" % (self.width-10, new_e.get_feed_length(self.width-10))).encode(), b"prime trail"

        ## purge
        purge_lines = int((self.height - 4)/2)

        for _ in range(purge_lines):
            if self.flipflop:
                yield b"G1 Y0.6 F3000", b"Y shift"
                yield ("G1 X%.3f E%.4f F2000" % (-self.width, new_e.get_feed_length(self.width))).encode(), b"purge trail"
                yield b"G1 Y1 F3000", b"Y shift"
                yield ("G1 X%.3f E%.4f F2000" % (self.width, new_e.get_feed_length(self.width))).encode(), b"purge trail"
            else:
                yield b"G1 Y1 F3000", b"Y shift"
                yield ("G1 X%.3f E%.4f F2000" % (-self.width, new_e.get_feed_length(self.width))).encode(), b"purge trail"
                yield b"G1 Y0.6 F3000", b"Y shift"
                yield ("G1 X%.3f E%.4f F2000" % (self.width, new_e.get_feed_length(self.width))).encode(), b"purge trail"

        yield b"G1 Y1 F3000", b"Y shift"
        yield ("G1 X%.3f E%.4f F1500" % (-self.width-2, new_e.get_feed_length(self.width-2))).encode(), b"purge trail"
        yield ("G1 X-2 E%.4f F%s" % (-new_e.retract, new_e.retract_speed)).encode(), b"purge trail"
        yield b"G1 X4 F3000", b"wipe"

        yield b"G90", b"absolute positioning"
        yield b"G92 E0", b"reset extruder position"
        yield None, b"TOOL CHANGE END"

        self.flipflop = not self.flipflop
