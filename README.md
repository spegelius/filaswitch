# filaswitch
Filament switch post processor for 3D printing

Disclaimer: i'm not responsible if anything bad happens due to use of this script.

Usage:

* You need Python 3.5 to run this script

Slicer configuration:

Add following G-Code lines to Simplify3D scripts:

* Starting Script:
- Enclose your starting script with:
; START SCRIPT START
[you start g-code lines here...]
; START SCRIPT END
It is also a good idea to add T0 to the starting scrips, to make sure first extruder is the main first extruder

* Tool Change Script:
; TOOL CHANGE
T[new_tool]

Post processing:
* after slicing your dual-color model, run the script:
* python filaswitch.py yourgcodefile.gcode

Result is another file, with _fs.gcode ending. You're ready to print :)
