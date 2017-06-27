filaswitch
==============================
Filament switch post processor for 3D printing. Currently tested with Prometheus System and Simplify3D.

Disclaimer: i'm not responsible if anything bad happens due to use of this script.

Prerequisites
-------------
* Python 3.5 to run this script.
    * In Windows, make sure python is added to %PATH%
    * In Linux, python3.5 should be available (Ubuntu). You do need package 'python3-tk', so use apt-get to install it
* Simplify3D 3.1.1 (older versions not tested)
* 3D Printer with 2 extruders - one nozzle setup
* Printer profile in S3D configured for dual extrusion


### Simplify3D configuration

* Open process and show advanced settings
##### G-code-tab
* select Relative extrusion distances (IMPORTANT)
##### Scripts-tab 
* Add following G-Code lines to Simplify3D scripts
* Starting Script: Enclose your starting script with:
> ; START SCRIPT START
##### Advanced-tab
* Set Tool Change Retraction distance to 0.0

> [you start g-code lines here...]

> ; START SCRIPT END

* It is also a good idea to add T0 to the starting scrips, to make sure first extruder is the main first extruder

* Tool Change Script:
> ; TOOL CHANGE

> T[new_tool]

Usage:
--------------------

First slice your dual-color model in Simplify3D

###Post processing (GUI):
* Open the GUI, in Windows use filaswitch.bat, in Linux use shell (python3 filaswitch.py)
* Click the 'Select g-code file...' button
* Browse and select the file
* Check info screen
* Done

###Post processing (cli):
* python3 filaswitch.py /path/tp/yourgcodefile.gcode (Linux)
* python filaswitch.py \path\to\yourgcodefile.gcode

Result is a new file, with _fs.gcode ending. You're ready to print :).
