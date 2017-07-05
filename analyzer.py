#!/usr/bin/env python3.5

import sys

from gcode import GCode

gcode = GCode()


def open_file(gcode_file):
    """ Read given g-code file into list """
    try:
        gf = open(gcode_file, 'rb')
    except Exception as e:
        print("Cannot open file %s" % gcode_file)
        return 1

    # remove extra EOL and empty lines
    _lines = [l.strip() for l in gf.readlines() if l.strip()]
    gf.close()
    return _lines

if __name__ == "__main__":
    debug = False
    if len(sys.argv) < 2:
        print("Need argument for file to process")
        exit(1)
    g_file = sys.argv[1]

    lines = open_file(g_file)

    prev_position = None
    lengths = []
    layer = []
    e_pos = 0

    wipes = []

    move_type = ""

    lnr = 0
    for line in lines:
        lnr += 1
        cmd, comment = gcode.read_gcode_line(line)

        if comment and comment.startswith(b"layer"):
            print("layer")
            lengths.append(layer)
            layer = []
        if not cmd:
            continue
        elif gcode.is_extrusion_move(cmd) or gcode.is_extrusion_speed_move(cmd):
            ## debugging feed rates
            pos = (gcode.last_match[0], gcode.last_match[1])

            if prev_position:
                if gcode.last_match[2] < 0:
                    e_pos += gcode.last_match[2]
                    move_type = "wipe"
                    wipes.append(gcode.last_match[2])
                else:
                    move_type = "print"
                    e_pos = 0
                length = gcode.calculate_path_length(prev_position, pos)
                _e_pos = gcode.last_match[2]
                feed_rate = gcode.calculate_feed_rate(length, _e_pos)
                layer.append(feed_rate)
                print("#%d %s %.2f %.5f %s" % (lnr, move_type, length, feed_rate, cmd))
            prev_position = pos
        elif gcode.is_head_move(cmd):
            prev_position = (gcode.last_match[0], gcode.last_match[1])
            if wipes:
                print("#%d wipe total %.1f" % (lnr, sum(wipes)))
                wipes = []
        elif gcode.is_extruder_move(cmd):
            e_pos += gcode.last_match[0]
    lengths.append(layer)
    for l in lengths:
        if l:
            print("%.5f %.5f" % (min(l), max(l)))