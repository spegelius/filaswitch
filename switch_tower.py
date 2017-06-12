
class SwitchTower:

    def __init__(self, start_position):
        self.width = 50
        self.height = 15
        self.raft_height = 15 + 1
        self.angle = 0
        self.start_position = start_position

    def get_raft_lines(self, retraction):
        """ G-code lines for the raft """

        yield b"; TOWER RAFT START"
        yield ("G1 X%s Y%s F9000      ; move to purge zone" % self.start_position).encode()
        yield b"G1 Z0.2 F1500         ; move z close"
        yield b"G91                   ; relative positioning"

        for _ in range(int(self.width/2)+2):
            yield ("G1 X1 Y%s E0.65 F1000    ; raft1" % self.raft_height).encode()
            yield b'G1 X1 F1000              ; raft2'
            yield ('G1 X-1 Y-%s E0.65 F1000  ; raft3' % self.raft_height).encode()
            yield b'G1 X1 F1000              ; raft4'

        if retraction:
            yield ("G1 E-%s F1500     ; retract" % retraction).encode()
        yield b"G90               ; absolute positioning"
        yield b"; TOWER RAFT END"
