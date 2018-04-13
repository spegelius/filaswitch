#!/usr/bin/env python3.5

import os
import pprint
import statistics
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


def adjust(lines, x, y):

    new_lines = []
    skip = False

    for line in lines:
        cmd, comment = gcode.read_gcode_line(line)
        if not cmd:
            new_lines.append((cmd, comment))

        elif gcode.is_relative_positioning(cmd):
            skip = True
            new_lines.append((cmd, comment))
        elif gcode.is_absolute_positioning(cmd):
            skip = False
            new_lines.append((cmd, comment))
        elif not skip and gcode.is_head_move(cmd):
            new_x = gcode.last_match[0] + x
            new_y = gcode.last_match[1] + y
            speed = gcode.last_match[3]
            new_cmd = gcode.gen_head_move(new_x, new_y, speed)
            new_lines.append((new_cmd, comment))
        elif not skip and gcode.is_extrusion_move(cmd):
            new_x = gcode.last_match[0] + x
            new_y = gcode.last_match[1] + y
            e_length = gcode.last_match[3]
            if gcode.last_match[4] is not None:
                new_cmd = gcode.gen_extrusion_speed_move(new_x, new_y, gcode.last_match[4], e_length)
            else:
                new_cmd = gcode.gen_extrusion_move(new_x, new_y, e_length)
            new_lines.append((new_cmd, comment))
        else:
            new_lines.append((cmd, comment))

    return new_lines

def save_new_file(filename, lines):
    """
    Save g-code lines into new file
    :return: new file path
    """

    _dir, f_name = os.path.split(filename)
    name, ext = os.path.splitext(f_name)
    new_file = os.path.join(_dir,  name + "_translated" + ext)
    try:
        with open(new_file, "wb") as nf:
            result = b"\r\n".join([gcode.format_to_string(cmd, comment) for cmd, comment in lines])
            nf.write(result)
            return new_file
    except Exception as e:
        print("Could not save file, error: %s" % e)
        return 1


if __name__ == "__main__":
    debug = False
    if len(sys.argv) < 4:
        print("Need arguments: file to process, X adjustment, Y adjustment")
        exit(1)
    g_file = sys.argv[1]

    lines = open_file(g_file)

    x = int(sys.argv[2])
    y = int(sys.argv[3])
    new_lines = adjust(lines, x, y)
    save_new_file(g_file, new_lines)
