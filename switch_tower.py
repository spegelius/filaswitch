
class SwitchTower:

    def __init__(self, start_position):
        self.width = 50
        self.height = 15
        self.angle = 0
        self.start_position = start_position

    def get_raft_lines(self):
        """ G-code lines for the raft """
        for _ in range(int(self.width/2)):
            yield 'G1 X1 Y%s E0.65 F1000    ; raft1' % self.height+1
            yield 'G1 X1 F1000              ; raft2'
            yield 'G1 X-1 Y-%s E0.65 F1000  ; raft3' % self.height+1
            yield 'G1 X1 F1000              ; raft4'
