

filaswitch
==============================
Filament switch post-processor for Simplify 3D (3.1.1, 4.0.x) and Prusa Slic3r (1.36.2,1.37.1,1.38.6).

This tool's main function is to add support for multi-color printing with single nozzle-multiple extruder systems to those slicer software that don't support such systems. The main functionality is similar to Prusa MMU Slic3r's purge sequence.
Main target currently is Simplify3D, which has support for multiple extruders, but doesn't have support for required advanced purge tower functionality.

Currently supports and tested with Prometheus System and Prusa MK2 MMU (Prusa support thanks to https://github.com/paukstelis).

Main features:
- adds material switch purge tower g-code to Simplify3D and Prusa Slic3r multi-extruder prints
- configurable purge amount (per-extruder support coming)
- fixes S3D ver 3.1.1 bug with 'Perform retraction during wipe movement'
- configurable purge sequences. HW configurations stored in files; editing and adding new configurations by user possible

Filaswitch detects tool changes from sliced files and adds a purge tower, with required additional g-code used to make the filament change jam-free. In this case this means:
- before changing tool, filament is 'rammed' out of the nozzle fast. This prepares the filament head for retraction
- first retract happens right after ramming and is short enough to leave the tip opf the filament in the hot ends cold zone
- after first retract, there's a pause to let the filament cool down somewhat
- after pause, long retract pulls the filament out of the hot end and beyond the filament splitter part, to allow inserting new filament
- optionally the long retract can have hot end cooling moves and filament moving back and forth inside the tube, for smoothing the tip

After old filament is retracted fully, new filament is fed. To clear the color of old filament, some amount of purgin is
needed and filaswitch does this by printing the purge material to the tower. Purge amount is configurable.

Perform retraction during wipe movement-bug (S3D 3.1.1):
- filaswitch detects if this feature is enabled in S3D profile and applies the fix automatically.
- one doesn't need to be a multi-color print to apply this fix. Simply omit the dual-extrusion S3D configuration and
filaswitch will skip multi-extrusion g-code addition

A note about Prusa Slic3r:
of course Prusa MK2 MMU users don't need this appication as Prusa Slic3r is made for the Prusa MMU. However, Prusa
Slic3r is really nice slic3r and it can be used with other printers. At least for now, the Slic3r's multi-material
settings aren't configurable enough to allow other printers use it fully. So filaswitch supports Prusa Slic3r until
this changes.

Disclaimer: i'm not responsible if anything bad happens due to use of this script.

If this software has been helpful to you, help the development by buying me a coffee/beer/filament :)

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/spegelius)

Prerequisites
-------------
* Python 3.5/3.6 to run this script.
    * In Windows, make sure python is added to %PATH%
    * In Linux, python should be available (Ubuntu). You do need package 'python3-tk', so use apt-get to install it
* Simplify3D 3.1.1 or 4.0.0/4.0.1 (older versions not tested) or Prusa Slic3r
* 3D Printer with 2 or more extruders - one nozzle setup (Prometheus system or Prusa MMU)
* Printer profile in S3D/Slic3r configured for dual extrusion

## Use case1:
Print multi-color/material model with multi-extruder printers and Simplify3D/Prusa Slic3r


### 1. Simplify3D configuration for Prometheus dual-extrusion

#### 1.1. Use example profile
filaswitch comes with some default Simplify3D profiles (located in Simplify3D_profiles), which can be used as a base for
creating your own printer profiles. New printer profile additions welcome.

These example profiles probably won't match your printer configurations so some experience with setting up a printer in Simplify3D is recommended.

#### 1.2. Manual profile setup

To create a new printer profile from scratch, use 'Configuration Assistant' in Help-menu and select 'Other'. This will create a properly
initialized multi-extruder profile. Don't use existing single-extruder profile. Reason for this is that Simplify3D stores
the extruder settings differently depending of the initial extruder count and adding them later in the profile editor
won't produce optimal multi-extruder prints. Not optimal = too many tool changes -> more waste.
There's a way to edit them to the .fff file outside Simplify3D, but we won't go there right now.

![alt text](https://github.com/spegelius/filaswitch/blob/README/res/img/S3D-ConfigurationAssistant.png "Configuration Assistant")

A proper multi-extruder profile shows "Auto-configure Extruders"-pull down on the right side:
![alt text](https://github.com/spegelius/filaswitch/blob/README/res/img/S3D-Profile_allextruders.png "Auto-configure extruders")

Add new process and finish all the settings that are specific to your printer.

Following are filaswitch specific settings that are needed for filaswitch to work.

##### 1.2.1. Advanced settings
###### 1.2.1.1. G-code-tab
* select 'Relative extrusion distances' (IMPORTANT)
###### 1.2.1.2. Scripts-tab 
* Add following G-Code lines to Simplify3D scripts
* **Starting Script**: Enclose your starting script with:
> `; START SCRIPT START`

> `[you start g-code lines here...]`

> `; START SCRIPT END`

* **Tool Change Script**:
> `; TOOL CHANGE`

> `T[new_tool]`

* (optional) to run the post-processing automatically, add this to the 'Additional terminal commands'-box:
* Linux:
    * /path/to/filaswitch.sh [output_filepath] YOUR-HW-CONFIG
* Windows:
    * c:\path\to\filaswitch.bat [output_filepath] YOUR-HW-CONFIG
* replace YOUR-HW-CONFIG with your hw-config. HW config list can be seen by opening the filaswitch GUI   
    
###### 1.2.1.3. Cooling-tab and Speeds-tab
* depending of your material and cooling needs it might be a good idea to lower the minimum layer time before increasing
cooling and slowing down. Filaswitch does add some extra time when printing the tower so the need for extra cooling decreases.

###### 1.2.1.4. Advanced-tab
* Set Tool Change Retraction distance to your normal retraction distance
    * also check retraction speed to match the normal retraction speed
#### 1.3. Slicing
Instructions for setting up prints TBD.

### 2. Slic3r configuration for Prometheus dual-extrusion
For now there isn't an example profile distributed with filaswitch for Prusa Slic3r. However, the default Prusa MK2 profile is a good
starting point and in Slic3r printer settings are easy to edit. Changing extruder count works as it should (Simplify3D,
take note) and settings are all logically laid out.

Following shows how to configure the printer settings for filaswitch use 

![alt text](https://github.com/spegelius/filaswitch/blob/README/res/img/Slic3r-Printer_settings.png "Slic3r Printer Settings")
* Open Slic3r -> Printer Settings
#### 2.1. General
* Set number of extruders
* select 'Use relative E distances' (IMPORTANT)
##### 2.1.1. Custom G-code
* Add G-Code lines below to following sections:
* **Start G-code**: Enclose your starting script with:
> `; START SCRIPT START`

> `[you start g-code lines here...]`

> `; START SCRIPT END`

* **Before layer change G-code**:
> `;BEFORE_LAYER_CHANGE [layer_num] [layer_z]`


* **Tool Change G-code**:
> `; TOOL CHANGE`

##### 2.1.2. Extruders n
* Retraction when tool is disabled to 0

#### 2.1.3. Running filaswitch automatically (optional)
* in Slic3r, terminal commands are tied to print settings. Open the settings-tab 
* add following line to 'Output options' - 'Post-processing scripts':
* Linux:
    * /path/to/filaswitch.sh YOUR-HW-CONFIG
* Windows:
    * c:\path\to\filaswitch.bat YOUR-HW-CONFIG
* replace YOUR-HW-CONFIG with your hw-config. HW config list can be seen by opening the filaswitch GUI
### 2.2. Slicing
Instructions for setting up prints TBD.

![alt text](https://github.com/spegelius/filaswitch/blob/README/res/img/Slic3r-Print_settings.png "Slic3r Printer Settings")

## 3. Usage:
Usin filaswitch as part of slicing has been described in slicer specific sections. This section describes how to run post-procesing manually.

First slice your dual-color model in Simplify3D/Prusa Sic3r. Instructions for setting up prints TBD.
Save g-code to disk.

#### 3.1. Post processing (GUI):
* Open the GUI, in Windows use filaswitch.bat, in Linux use shell ./filaswitch.sh
* Select your HW configuration from the drop-down list
* Click the 'Browse...'to select the g-code file
* Check info screen for information

####3.2. Post processing (cli):
* Linux:
    * ./filaswitch.sh /path/to/yourgcodefile.gcode YOUR-HW-CONFIG
* Windows 
    * filaswitch.bat \path\to\yourgcodefile.gcode YOUR-HW-CONFIG
* replace YOUR-HW-CONFIG with your hw-config. HW config list can be seen by opening the filaswitch GUI

####3.3. Printing
At the end of the post-processing, filaswitch will print info about what extruder needs to be loaded or if all extruders
need to be unloaded. Basically if the HW configuration you used has prerun prime enabled, all extruders need to be unloaded.
If prerun prime is disabled, filaswitch expects T0 to be loaded (this might change in the future). What is prerun prime?
Prerun prime is a pre-print sequence which loads and unloads each extruder used in the current print to make sure they
are primed for the print. The last prime is not unloaded as print is going to start with it.
 
Result is a new file, with _fs.gcode ending. You're ready to print :).

## 4. Adding new hw-configuration
Hw configurations are list of parameters that define how the filament switch sequence is executed. Various purge and
retract lengths and peeds can be altered and even disabled by commenting lines out. Some values are required and 
filaswitch will fail to process if something mandatory is missing.

To add new hw config, go to hw_configurations directory and make a copy of one of the existing files. The name of the
file will be the name of the configuration as seen in the filaswitch GUI dro-down menu. Now alter the values as you see
fit for your hardware.

What configuration to copy? Well that's hard to say as your hardware might something that isn't previously supported. If
you have a variation of Prometheus System, all Prometheus config variants should be a good starting point. But to
properly configure the filament switch sequence, you'll need to understand your hardware anyways, so the starting point
shouldn't matter that much. 

If you want your new shiny profile to be added to main filaswitch repo, fork the repo, make a commit to your repo and
create a pull request. I'll be happy to include new configurations for other people to use.

##Use case2:
Only fix S3D 3.1.1 bug with Retract during wipe (does someone still use 3.1.1?)

First slice your model in Simplify3D, no need to change any settings.
Save g-code to disk.

Usage as in section 3.