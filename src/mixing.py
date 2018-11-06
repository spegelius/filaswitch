#!/usr/bin/env python3.5

import pprint
import os
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


def color_mixing(lines):

    # count layers
    layer_count = 0
    for line in lines:
        if b"BEGIN_LAYER_OBJECT" in line:
            layer_count += 1

    mixing_interval = layer_count/100
    print(mixing_interval)

    # add mixing ratios
    ratio = 0
    index = 0
    layer_count = mixing_interval - 1
    while True:
        try:
            line = lines[index]
            if b"BEGIN_LAYER_OBJECT" in line:
                if layer_count == mixing_interval - 1:
                    mixing_cmd = ("M165 A{} B{} ; change mixing ratio".format(ratio, 100-ratio)).encode()
                    print(mixing_cmd)
                    lines.insert(index, mixing_cmd)
                    ratio += 1
                    layer_count = 0
                    index += 1
                else:
                    layer_count += 1

            index += 1
        except IndexError:
            break
    return lines


def save_new_file(filename, lines):
    """
    Save g-code lines into new file
    :return: new file path
    """

    _dir, f_name = os.path.split(filename)
    name, ext = os.path.splitext(f_name)
    new_file = os.path.join(_dir,  name + "_mixed" + ext)
    try:
        with open(new_file, "wb") as nf:
            result = b"\r\n".join([gcode.format_to_string(cmd, None) for cmd in lines])
            nf.write(result)
            return new_file
    except Exception as e:
        print("Could not save file, error: %s" % e)
        return 1


if __name__ == "__main__":
    debug = False
    if len(sys.argv) < 2:
        print("Need argument for file to process")
        exit(1)
    g_file = sys.argv[1]

    lines = open_file(g_file)
    lines = color_mixing(lines)
    save_new_file(g_file, lines)