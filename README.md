

filaswitch
==============================
Filament switch post-processor for Simplify 3D (3.1.1, 4.0.x) and Prusa Slic3r (1.36.2,1.37.1,1.38.6).

This tool's main function is to add support for multi-color printing with single nozzle-multiple extruder systems with slicer software that don't support such systems. The main functionality is similar to Prusa MMU Slic3r's purge sequence.
Main target currently is Simplify3D, which has support for multiple extruders, but doesn't have support for required advanced purge tower functionality.

Currently supports and tested with Prometheus System and Prusa MK2 MMU (Prusa support thanks to https://github.com/paukstelis).

Main features:
- adds material switch purge tower g-code to Simplify3D and Prusa Slic3r multi-extruder prints
- configurable purge amount (pre-extruder support coming)
- fixes S3D ver 3.1.1 bug with 'Perform retraction during wipe movement'
- configurable purge sequences. HW configurations stored in files, free for user to add and edit

Filaswitch detects tool changes from sliced files and adds it's own purge tower, with required additional g-code used to make the filament change jam-free. In this case this means:
- before changing tool, filament is 'rammed' out of the nozzle fast. This prepares the filament head for retraction
- first retract happens right after ramming and is short enough to leave the tip opf the filament in the hot ends cold zone
- after first retract, there's a pause to let the filament cool down somewhat
- after pause, long retract pulls the filament out of the hot end and beyond the filament splitter part, to allow inserting new filament
- optionally the long retract can have hot end cooling moves and filament moving back and fort inside the tube, for smoothing the tip

After old filament is retracted fully, new filament is fed. To clear the color of old filament, some amount of purgin is needed and filaswitch does this by printing the purge material to the tower. 

Perform retraction during wipe movement-bug (S3D 3.1.1):
- filaswitch detects if this feature is enabled in S3D profile and applies the fix automatically.
- one doesn't need to have Prometheus System to apply this fix. Simply omit the dual-extrusion S3D configuration and filaswitch will skip 
 dual-extrusion g-code addition

Disclaimer: i'm not responsible if anything bad happens due to use of this script.

If this software has been helpful to you, buy me a coffee/beer/filament :)

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/spegelius)

Prerequisites
-------------
* Python 3.5/3.6 to run this script.
    * In Windows, make sure python is added to %PATH%
    * In Linux, python should be available (Ubuntu). You do need package 'python3-tk', so use apt-get to install it
* Simplify3D 3.1.1 or 4.0.0/4.0.1 (older versions not tested) or Prusa Slic3r
* 3D Printer with 2 or more extruders - one nozzle setup (Prometheus system or Prusa MMU)
* Printer profile in S3D/Slic3r configured for dual extrusion

##Use case1:
Print dual-color model with Prometheus system

### Simplify3D configuration for Prometheus dual-extrusion

* Open process and show advanced settings
##### G-code-tab
* select 'Relative extrusion distances' (IMPORTANT)
##### Scripts-tab 
* Add following G-Code lines to Simplify3D scripts
* **Starting Script**: Enclose your starting script with:
> `; START SCRIPT START`

> `[you start g-code lines here...]`

> `; START SCRIPT END`

* It is also a good idea to add T0 to the starting scrips, to make sure first extruder is the main first extruder

* **Tool Change Script**:
> `; TOOL CHANGE`

> `T[new_tool]`

##### Advanced-tab
* Set Tool Change Retraction distance to your normal retraction distance
    * also check retraction speed to match the normal retraction speed

### Slic3r configuration for Prometheus dual-extrusion

* Open Slic3r -> Printer Settings
##### General
* Set number of extruders
* select 'Use relative E distances' (IMPORTANT)
##### Custom G-code
* Add G-Code lines below to following sections:
* **Start G-code**: Enclose your starting script with:
> `; START SCRIPT START`

> `[you start g-code lines here...]`

> `; START SCRIPT END`

* It is also a good idea to add T0 to the starting scrips, to make sure first extruder is the main first extruder

* **Before layer change G-code**:
> `;BEFORE_LAYER_CHANGE [layer_num] [layer_z]`


* **Tool Change G-code**:
> `; TOOL CHANGE`

##### Extruders n
* Retraction when tool is disabled to 0

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
* python3 filaswitch.py /path/to/yourgcodefile.gcode (Linux) PEEK-PRO-12|PTFE-PRO-12|PTFE-EV6
* python filaswitch.py \path\to\yourgcodefile.gcode PEEK-PRO-12|PTFE-PRO-12|PTFE-EV6

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
