filaswitch
==============================
Filament switch post processor for 3D printing. Currently tested with Prometheus System and Simplify3D.

Disclaimer: i'm not responsible if anything bad happens due to use of this script.

Prerequisites
-------------
* Python 3.5 to run this script
* Simplify3D 3.1.1 (older versions not tested)
* 3D Printer with 2 extruders - one nozzle setup
* Printer profile in S3D configured for dual extrusion


### Simplify3D configuration

* Open process and show advanced settings
##### Advanced-tab
* Set Tool Change Retraction distance to 0.0
##### Scripts-tab 
* Add following G-Code lines to Simplify3D scripts
* Starting Script: Enclose your starting script with:
> ; START SCRIPT START

> [you start g-code lines here...]

> ; START SCRIPT END

* It is also a good idea to add T0 to the starting scrips, to make sure first extruder is the main first extruder

* Tool Change Script:
> ; TOOL CHANGE

> T[new_tool]

Usage:
--------------------

Post processing:
* after slicing your dual-color model, run the script:
* python filaswitch.py yourgcodefile.gcode

Result is anew file, with _fs.gcode ending. You're ready to print :).
