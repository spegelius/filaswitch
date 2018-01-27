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


def check_backlash(backlash, prev_pos, new_pos, prev_dir):
    if new_pos < prev_pos:
        new_dir = -1
    elif new_pos > prev_pos:
        new_dir = 1
    else:
        new_dir = prev_dir

    if prev_dir != 0 and new_dir != prev_dir:
        return new_dir, (prev_pos + backlash) * new_dir
    return new_dir, None

def adjust(lines, x, y, z):

    new_lines = []

    absolute = True

    x_dir = 0
    y_dir = 0
    z_dir = 0

    prev_x = 0
    prev_y = 0
    prev_z = 0

    for line in lines:
        cmd, comment = gcode.read_gcode_line(line)
        if not cmd:
            new_lines.append((cmd, comment))

        elif gcode.is_relative_positioning(cmd):
            absolute = False
            new_lines.append((cmd, comment))
        elif gcode.is_absolute_positioning(cmd):
            absolute = False
            new_lines.append((cmd, comment))
        elif gcode.is_head_move(cmd):
            x_pos = gcode.last_match[0]
            y_pos = gcode.last_match[1]
            speed = gcode.last_match[2]

            x_dir, new_x_pos = check_backlash(x, prev_x, x_pos, x_dir)
            prev_x = x_pos

            y_dir, new_y_pos = check_backlash(y, prev_y, y_pos, y_dir)
            prev_y = y_pos



            new_lines.append((cmd, comment))
        # elif not skip and gcode.is_extrusion_move(cmd):
        #     new_x = gcode.last_match[0] + x
        #     new_y = gcode.last_match[1] + y
        #     e_length = gcode.last_match[2]
        #     new_cmd = gcode.gen_extrusion_move(new_x, new_y, e_length)
        #     new_lines.append((new_cmd, comment))
        # elif not skip and gcode.is_extrusion_speed_move(cmd):
        #     new_x = gcode.last_match[0] + x
        #     new_y = gcode.last_match[1] + y
        #     e_length = gcode.last_match[2]
        #     speed = gcode.last_match[3]
        #     new_cmd = gcode.gen_extrusion_speed_move(new_x, new_y, speed, e_length)
        #     new_lines.append((new_cmd, comment))
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
    new_file = os.path.join(_dir,  name + "_backlash" + ext)
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
    if len(sys.argv) < 5:
        print("Need arguments: file to process, X backlash (mm), Y adjustment, Z backlash (mm). Use 0 if no backlash needed")
        exit(1)
    g_file = sys.argv[1]

    lines = open_file(g_file)

    x = float(sys.argv[2])
    y = float(sys.argv[3])
    z = float(sys.argv[4])
    new_lines = adjust(lines, x, y, z)
    save_new_file(g_file, new_lines)
