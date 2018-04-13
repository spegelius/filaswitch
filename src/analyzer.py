#!/usr/bin/env python3.5

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


def debug_wipes(lines, show_lines=False):
    prev_position = None
    layer_feed_rates = []
    feed_rates = []
    e_pos = 0

    wipes = []
    wipe_totals = []

    last_speed = 0

    lnr = 0

    for line in lines:
        lnr += 1
        cmd, comment = gcode.read_gcode_line(line)

        if comment and b"layer" in comment:
            layer_feed_rates.append(feed_rates)
            feed_rates = []
        if not cmd:
            continue
        elif gcode.is_extrusion_move(cmd):
            ## debugging feed rates
            pos = (gcode.last_match[0], gcode.last_match[1])

            try:
                last_speed = gcode.last_match[4]
            except Exception as e:
                #print(e)
                pass

            if prev_position:
                if gcode.last_match[3] < 0:
                    e_pos += gcode.last_match[3]
                    move_type = "wipe"
                    wipes.append(gcode.last_match[3])
                else:
                    move_type = "print"
                    e_pos = 0
                length = gcode.calculate_path_length(prev_position, pos)
                if length > 0.1:
                    _e_pos = gcode.last_match[3]
                    feed_rate = gcode.calculate_feed_rate(length, _e_pos)
                    feed_rates.append(feed_rate)
                    if show_lines:
                        print("#%d %s %.2f %.5f %s" % (lnr, move_type, length, feed_rate, cmd))
                    if feed_rate > 0.1 or feed_rate < -0.1:
                        speed = 0
                        if last_speed:
                            rate = length/(last_speed/60)
                            speed = 1/rate*_e_pos
                        print("#%d %.5f %.2f" % (lnr, feed_rate, speed))
            prev_position = pos
        elif gcode.is_head_move(cmd):
            prev_position = (gcode.last_match[0], gcode.last_match[1])
            if wipes:
                wipe_totals.append(sum(wipes))
                if show_lines:
                    print("#%d wipe total %.1f" % (lnr, sum(wipes)))
                wipes = []
        elif gcode.is_extruder_move(cmd):
            e_pos += gcode.last_match[0]
    layer_feed_rates.append(feed_rates)

    lnum = 0
    for l in layer_feed_rates:
        lnum += 1
        if l:
            print("Feed rates layer #%d: min %.5f, max %.5f" % (lnum, min(l), max(l)))
    if wipe_totals:
        print("Wipes: min %.5f, max %.5f" % (min(wipe_totals), max(wipe_totals)))


def debug_outer_perimeter(lines):
    speeds = []
    feed_rates = []
    is_outer = False
    prev_position = None

    lnr = 0
    for line in lines:
        lnr += 1
        cmd, comment = gcode.read_gcode_line(line)
        if comment:
            # S3D comment
            if b"outer perimeter" in comment:
                is_outer = True
            else:
                is_outer = False
        if cmd:
            if is_outer:
                position = None
                if gcode.is_extrusion_move(cmd):
                    if gcode.last_match[3] > 0 and gcode.last_match[4] is not None:
                        speeds.append(gcode.last_match[4])
                    position = gcode.last_match[0], gcode.last_match[1]

                if prev_position and position:
                    length = gcode.calculate_path_length(prev_position, position)
                    _e_pos = gcode.last_match[3]
                    if _e_pos > 0:
                        feed_rate = gcode.calculate_feed_rate(length, _e_pos)
                        print(lnr, feed_rate)
                        feed_rates.append(feed_rate)
                if position:
                    prev_position = position
            if gcode.is_head_move(cmd):
                prev_position = (gcode.last_match[0], gcode.last_match[1])
    # print(speeds)
    print(max(feed_rates))
    outer_perimeter_speed = sum(speeds) / len(speeds)
    # print(sum(feed_rates)/len(feed_rates))
    #pprint.pprint(feed_rates)
    print("Median:", statistics.median(feed_rates))
    print("Mean:", statistics.mean(feed_rates))

if __name__ == "__main__":
    debug = False
    if len(sys.argv) < 2:
        print("Need argument for file to process")
        exit(1)
    g_file = sys.argv[1]

    lines = open_file(g_file)
    debug_wipes(lines)
    #debug_outer_perimeter(lines)