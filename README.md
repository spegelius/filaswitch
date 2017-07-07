filaswitch
==============================
Filament switch post processor for Simplify 3D (3.1.1).
Currently tested with Prometheus System.
Main features:
- adds material switch purge tower g-code to Simplify3D dual-extruder prints (Prometheus System supported)
- fixes S3D ver 3.1.1 bug with 'Perform retraction during wipe movement'

Perform retraction during wipe movement-bug:
- filaswitch detects if this feature is enabled in S3D profile and applies the fix automatically.
- also one doesn't need to have Prometheus System to apply this fix. Simply omit the dual-extrusion S3D configuration and filaswitch will skip 
 dual-extrusion g-code addition

Disclaimer: i'm not responsible if anything bad happens due to use of this script.

Prerequisites
-------------
* Python 3.5 to run this script.
    * In Windows, make sure python is added to %PATH%
    * In Linux, python3.5 should be available (Ubuntu). You do need package 'python3-tk', so use apt-get to install it
* Simplify3D 3.1.1 (older versions not tested)
* 3D Printer with 2 extruders - one nozzle setup
* Printer profile in S3D configured for dual extrusion

##Use case1:
Print dual-color model with Prometheus system

### Simplify3D configuration for Prometheus dual-extrusion

* Open process and show advanced settings
##### G-code-tab
* select Relative extrusion distances (IMPORTANT)
##### Scripts-tab 
* Add following G-Code lines to Simplify3D scripts
* Starting Script: Enclose your starting script with:
> ; START SCRIPT START
##### Advanced-tab
* Set Tool Change Retraction distance to 0.0 or make sure it is not more than your normal retraction
    * also check retraction speed to match the normal retraction speed
* Disable 'Perform retraction during wipe movement'

> [you start g-code lines here...]

> ; START SCRIPT END

* It is also a good idea to add T0 to the starting scrips, to make sure first extruder is the main first extruder

* Tool Change Script:
> ; TOOL CHANGE

> T[new_tool]

###Usage:

First slice your dual-color model in Simplify3D.
Save g-code to disk.

####Post processing (GUI):
* Open the GUI, in Windows use filaswitch.bat, in Linux use shell (python3 filaswitch.py)
* Select your HW configuration; PTFE, E3DV6 or PEEK
* Click the 'Browse...'to select the g-code file
* Check info screen
* Done

####Post processing (cli):
* python3 filaswitch.py /path/tp/yourgcodefile.gcode (Linux) PTFE|E3DV6|PEEK
* python filaswitch.py \path\to\yourgcodefile.gcode PTFE|E3DV6|PEEK

Result is a new file, with _fs.gcode ending. You're ready to print :).


##Use case2:
Only fix S3D bug with Retract during wipe

First slice your model in Simplify3D, no need to change any settings.
Save g-code to disk.

####Post processing (GUI):
* Open the GUI, in Windows use filaswitch.bat, in Linux use shell (python3 filaswitch.py)
* Select your HW configuration; PTFE, E3DV6 or PEEK (doesn't matter in this case)
* Click the 'Browse...'to select the g-code file
* Check info screen
* Done
 
Result is a new file, with _fs.gcode ending. You're ready to print :).