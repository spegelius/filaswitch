#!/usr/bin/env python3.5

"""
# filaswitch

G-code post processor for adding proper purge tower for multi-extruder - one hotend setup.

Disclaimer: i'm not responsible if anything, good or bad, happens due to use of this script.

"""
import argparse
import os
import sys
from tkinter import *
import tkinter.filedialog as fdialog
from tkinter.messagebox import showerror
from tkinter.ttk import *

from octoprint import OctoPrint

# from slicer_cura import CuraPrintFile
from slicer_kisslicer import KISSlicerGCodeFile
from slicer_simplify3d import Simplify3dGCodeFile
from slicer_prusa_slic3r import PrusaSlic3rCodeFile
from slicer_cura import CuraGCodeFile

from logger import Logger

from settings import (
    Settings,
    LINE_COUNT_DEFAULT,
    AUTO,
    TOWER_POSITIONS,
    LINES,
    BRIM_SIZE,
    BRIM_DEFAULT,
    BRIM_AUTO,
    INFILL_STYLES,
    INFILL_ZIGZAG,
)

import utils

prog_dir = os.path.dirname(os.path.realpath(__file__))
root_dir = os.path.realpath(os.path.join(prog_dir, ".."))

status_file = os.path.join(root_dir, ".status")
status = utils.load_status(status_file)

# TODO: merge status to settings
settings = Settings()

version = "0.22.0"


def detect_file_type(gcode_file, log):
    with open(gcode_file, "r") as gf:
        line1 = gf.readline()
        if line1.startswith("; G-Code generated by Simplify3D(R)"):
            log.info("Detected Simplify3D format")
            return Simplify3dGCodeFile
        elif line1.startswith("; KISSlicer"):
            log.info("Detected KISSlicer format")
            return KISSlicerGCodeFile
        elif line1.startswith("; generated by Slic3r") and (
            "prusa3d" in line1 or "Prusa Edition" in line1
        ):
            log.info("Detected Prusa Slic3r format")
            return PrusaSlic3rCodeFile
        elif line1.startswith("; generated by PrusaSlicer"):
            log.info("Detected PrusaSlicer format")
            return PrusaSlic3rCodeFile
        else:
            for _ in range(20):
                line = gf.readline()
                if line.startswith(
                    ";Generated with Cura_SteamEngine"
                ) or line.startswith(";GENERATOR.NAME:Cura_SteamEngine"):
                    log.info("Detected Cura format")
                    return CuraGCodeFile
        log.error("No supported gcode file detected.")
        exit(1)


class TopFrame(Frame):
    def __init__(self, logger, master, gui):
        super().__init__(master)
        self.log = logger
        self.gui = gui
        self.grid(row=0, column=0, columnspan=5)
        self.create_widgets()

        self.result_file = None
        self.last_upload = None

    def create_widgets(self):

        # labels
        self.hwlabel = Label(self, text="1. Select HW config").grid(
            row=0, column=0, sticky=W, padx=5, pady=3
        )
        self.gc_label = Label(self, text="2. Select g-code to process").grid(
            row=1, column=0, sticky=W, padx=5, pady=3
        )
        self.octoupload_label = Label(self, text="3. Upload to OctoPrint").grid(
            row=2, column=0, sticky=W, padx=5, pady=3
        )
        self.octoprint_label = Label(self, text="4. Start OctoPrint print").grid(
            row=3, column=0, sticky=W, padx=5, pady=3
        )

        hw_configs = settings.get_hw_config_names()

        # HW config
        self.hw_var = StringVar(self)
        if self.gui.last_hwconfig and self.gui.last_hwconfig in hw_configs:
            self.hw_var.set(self.gui.last_hwconfig)
        else:
            self.hw_var.set(hw_configs[0])

        self.option = OptionMenu(self, self.hw_var, self.hw_var.get(), *hw_configs)
        self.option.grid(row=0, column=1, sticky=W, padx=5, pady=3)

        # browse
        self.f_button = Button(self)
        self.f_button["text"] = "Browse..."
        self.f_button["command"] = self.load_file
        self.f_button.grid(row=1, column=1, sticky=W, padx=5, pady=3)

        # octoprint upload
        self.ou_button = Button(self)
        self.ou_button["text"] = "OctoPrint upload"
        self.ou_button["command"] = self.octoprint_upload
        self.ou_button.grid(row=2, column=1, sticky=W, padx=5, pady=3)
        self.ou_button.config(state=DISABLED)

        # octoprint start print
        self.os_button = Button(self)
        self.os_button["text"] = "OctoPrint start print"
        self.os_button["command"] = self.octoprint_start
        self.os_button.grid(row=3, column=1, sticky=W, padx=5, pady=3)
        self.os_button.config(state=DISABLED)

        # quit
        style = Style()
        style.configure("red_fg.TButton", foreground="red")
        self.quit = Button(self, text="QUIT", command=self.quit, style="red_fg.TButton")
        self.quit.grid(row=4, column=1, sticky=W, padx=5, pady=3)

    def octoprint_upload(self):
        if self.result_file:
            octoprint = OctoPrint(
                self.gui.octoprint_frame.url_var.get(),
                self.gui.octoprint_frame.api_key_var.get(),
                self.log,
            )
            try:
                self.log.info(
                    "Uploading {} to OctoPrint folder {}, please wait...".format(
                        self.result_file,
                        self.gui.octoprint_frame.upload_folder_var.get(),
                    )
                )
                self.last_upload = octoprint.upload_file(
                    self.result_file, self.gui.octoprint_frame.upload_folder_var.get()
                )
                self.log.info("Upload done")
                self.os_button.config(state=NORMAL)
            except Exception as e:
                self.last_upload = None
                self.log.error(e)
        else:
            self.log.warning("No processed file, cannot upload")

    def octoprint_start(self):
        if self.last_upload:
            octoprint = OctoPrint(
                self.gui.octoprint_frame.url_var.get(),
                self.gui.octoprint_frame.api_key_var.get(),
                self.log,
            )
            octoprint.start_print(self.last_upload)
        else:
            self.log.warning("No file uploaded to Octoprint, cannot start print")

    def update_status(self):
        """
        Updates status-data with values from GUI elements. usually executed before shutting down
        :return:
        """
        status["last_hwconfig"] = self.hw_var.get()
        status["last_position"] = self.gui.adv_frame.position_var.get()
        status["last_line_count"] = self.gui.adv_frame.lines_var.get()
        status["force_raft"] = (
            "true" if self.gui.adv_frame.raft_force_var.get() else "false"
        )
        status["raft_multi"] = self.gui.adv_frame.raft_multi_var.get()
        status["purge_multi"] = self.gui.adv_frame.purge_multi_var.get()
        status["purge_speed"] = self.gui.adv_frame.purge_speed_var.get()
        status["debug"] = "true" if self.gui.adv_frame.debug_var.get() else "false"
        status["tower_fan_off"] = (
            "true" if self.gui.adv_frame.tower_fan_off_var.get() else "false"
        )
        status["infill_style"] = self.gui.adv_frame.infill_style_var.get()
        brim_var = self.gui.adv_frame.brim_size_var.get()
        if brim_var == BRIM_AUTO:
            status["brim_size"] = BRIM_DEFAULT
            status["brim_auto"] = "true"
        else:
            status["brim_size"] = brim_var
            status["brim_auto"] = "false"

        status["octoprint_url"] = self.gui.octoprint_frame.url_var.get()
        status["octoprint_api_key"] = self.gui.octoprint_frame.api_key_var.get()
        status[
            "octoprint_upload_folder"
        ] = self.gui.octoprint_frame.upload_folder_var.get()

    def quit(self):
        self.update_status()
        self.gui.quit()

    def load_file(self):
        """
        Loads and processes a gcode file
        :return:
        """
        self.gui.info.update_status("----------------------")
        last_dir = status.get("last_dir")
        if last_dir and os.path.exists(status["last_dir"]):
            gcode_file = fdialog.askopenfilename(
                filetypes=(("G-code files", "*.gcode"), ("all files", "*.*")),
                initialdir=status["last_dir"],
            )
        else:
            gcode_file = fdialog.askopenfilename(
                filetypes=(("G-code files", "*.gcode"), ("all files", "*.*"))
            )

        if gcode_file:
            try:
                self.ou_button.config(state=DISABLED)
                self.os_button.config(state=DISABLED)

                settings.hw_config = self.hw_var.get()
                settings.purge_lines = int(self.gui.adv_frame.lines_var.get())
                settings.tower_position = self.gui.adv_frame.position_var.get()
                settings.force_raft = self.gui.adv_frame.raft_force_var.get()
                settings.raft_multi = int(self.gui.adv_frame.raft_multi_var.get())
                settings.purge_multi = int(self.gui.adv_frame.purge_multi_var.get())
                settings.purge_speed = int(self.gui.adv_frame.purge_speed_var.get())
                settings.tower_fan_off = self.gui.adv_frame.tower_fan_off_var.get()
                settings.infill_style = self.gui.adv_frame.infill_style_var.get()

                brim_val = self.gui.adv_frame.brim_size_var.get()

                if brim_val == BRIM_AUTO:
                    settings.brim = BRIM_DEFAULT
                    settings.brim_auto = True
                else:
                    settings.brim = int(brim_val)
                    settings.brim_auto = False

                print_type = detect_file_type(gcode_file, self.log)
                pf = print_type(self.log, settings)
                self.result_file = pf.process(gcode_file)
                if self.gui.info:
                    self.log.info("New file saved: %s" % self.result_file)
                # save last used dir for later use
                file_dir = os.path.dirname(gcode_file)
                status["last_dir"] = file_dir

                # enabled OctoPrint upload if OctoPrint settings aren't empty
                if (
                    self.gui.octoprint_frame.url_var.get()
                    and self.gui.octoprint_frame.api_key_var.get()
                ):
                    self.ou_button.config(state=NORMAL)

            except Exception as e:
                self.log.exception("Gcode processing failed: %s" % e)
                # showerror("File open error", "Cannot open file %s" % gcode_file)
        else:
            self.log.info("Aborted")


class OctoPrintFrame(Frame):
    """
    OctoPrint GUI frame
    """

    def __init__(self, logger, master, gui):
        super().__init__(master)
        self.log = logger
        self.gui = gui
        self.grid(row=0, column=0, columnspan=5)
        self.create_widgets()

    def create_widgets(self):
        """
        Creates OctoPrint GUI elements
        :return:
        """
        self.url_label = Label(self, text="OctoPrint url").grid(
            row=0, column=0, sticky=W, padx=5, pady=3
        )
        self.api_key_label = Label(self, text="Octoprint API key").grid(
            row=1, column=0, sticky=W, padx=5, pady=3
        )
        self.upload_folder_label = Label(self, text="Octoprint upload folder").grid(
            row=2, column=0, sticky=W, padx=5, pady=3
        )

        # url
        self.url_var = StringVar(self)
        if self.gui.octoprint_url:
            self.url_var.set(self.gui.octoprint_url)
        else:
            self.url_var.set("")

        self.url_input = Entry(self, width=60, textvariable=self.url_var)
        self.url_input.grid(row=0, column=1, sticky=W, padx=5, pady=3)

        # api key
        self.api_key_var = StringVar(self)
        if self.gui.octoprint_api_key:
            self.api_key_var.set(self.gui.octoprint_api_key)
        else:
            self.api_key_var.set("")

        self.api_key_input = Entry(self, width=40, textvariable=self.api_key_var)
        self.api_key_input.grid(row=1, column=1, sticky=W, padx=5, pady=3)

        # upload folder
        self.upload_folder_var = StringVar(self)
        if self.gui.octoprint_upload_folder:
            self.upload_folder_var.set(self.gui.octoprint_upload_folder)
        else:
            self.upload_folder_var.set("")

        self.upload_folder_input = Entry(
            self, width=40, textvariable=self.upload_folder_var
        )
        self.upload_folder_input.grid(row=2, column=1, sticky=W, padx=5, pady=3)


class AdvancedFrame(Frame):
    """
    Advanced options frame
    """

    def __init__(self, logger, master, gui):
        super().__init__(master)
        self.log = logger
        self.gui = gui
        self.grid(row=0, column=0, columnspan=5)
        self.create_widgets()

    def create_widgets(self):
        """
        Creates Advanced options GUI elements
        :return:
        """
        # Labels, first column
        self.position_label = Label(self, text="Purge tower position").grid(
            row=0, column=0, sticky=W, padx=5, pady=3
        )
        self.size_label = Label(self, text="Purge lines (default: 6)").grid(
            row=1, column=0, sticky=W, padx=5, pady=3
        )
        self.raft_force_label = Label(self, text="Force raft").grid(
            row=2, column=0, sticky=W, padx=5, pady=3
        )
        self.raft_multi_label = Label(self, text="Raft extrusion %").grid(
            row=3, column=0, sticky=W, padx=5, pady=3
        )
        self.debug_label = Label(self, text="Enable debug prints").grid(
            row=4, column=0, sticky=W, padx=5, pady=3
        )

        # Labels, 2nd column
        self.brim_label = Label(self, text="Tower brim loops").grid(
            row=0, column=2, sticky=W, padx=5, pady=3
        )
        self.purge_multi_label = Label(self, text="Purge extrusion %").grid(
            row=1, column=2, sticky=W, padx=5, pady=3
        )
        self.purge_speed_label = Label(
            self, text="Purge extrusion max speed (mm/s)"
        ).grid(row=2, column=2, sticky=W, padx=5, pady=3)
        self.tower_fan_off_label = Label(self, text="Fan off during tower").grid(
            row=3, column=2, sticky=W, padx=5, pady=3
        )
        self.infill_style_label = Label(self, text="Tower infill layer style").grid(
            row=4, column=2, sticky=W, padx=5, pady=3
        )

        # position
        self.position_var = StringVar(self)

        if self.gui.last_position and self.gui.last_position in TOWER_POSITIONS:
            self.position_var.set(self.gui.last_position)
        else:
            self.position_var.set(AUTO)

        self.position_option = OptionMenu(
            self, self.position_var, self.position_var.get(), *TOWER_POSITIONS
        )
        self.position_option.grid(row=0, column=1, sticky=W, padx=5, pady=3)

        # size
        self.lines_var = StringVar(self)
        if self.gui.last_line_count:
            if self.gui.last_line_count in LINES:
                self.lines_var.set(self.gui.last_line_count)
            else:
                self.lines_var.set(LINE_COUNT_DEFAULT)
        else:
            self.lines_var.set(LINE_COUNT_DEFAULT)

        self.lines_box = OptionMenu(self, self.lines_var, self.lines_var.get(), *LINES)
        self.lines_box.grid(row=1, column=1, sticky=W, padx=5, pady=3)

        # raft force
        self.raft_force_var = BooleanVar(self)
        self.raft_force_var.set(self.gui.force_raft)

        self.raft_force_box = Checkbutton(self, variable=self.raft_force_var)
        self.raft_force_box.grid(row=2, column=1, sticky=W, padx=5, pady=3)

        # raft extrusion multiplier
        raft_multi_values = [80 + val * 5 for val in range(13)]
        self.raft_multi_var = StringVar(self)
        if self.gui.raft_multi:
            if self.gui.raft_multi in raft_multi_values:
                self.raft_multi_var.set(self.gui.raft_multi)
            else:
                self.raft_multi_var.set(100)
        else:
            self.raft_multi_var.set(100)

        self.raft_multi_box = OptionMenu(
            self, self.raft_multi_var, self.raft_multi_var.get(), *raft_multi_values
        )
        self.raft_multi_box.grid(row=3, column=1, sticky=W, padx=5, pady=3)

        # debug
        self.debug_var = BooleanVar(self)
        self.debug_var.set(self.gui.debug)

        self.debug_box = Checkbutton(
            self, variable=self.debug_var, command=self.set_debug
        )
        self.debug_box.grid(row=4, column=1, sticky=W, padx=5, pady=3)

        # brim size
        self.brim_size_var = StringVar(self)
        brim_opts = [BRIM_AUTO]
        brim_opts.extend(BRIM_SIZE)
        if self.gui.brim_auto:
            self.brim_size_var.set(BRIM_AUTO)
        elif self.gui.brim_size and self.gui.brim_size in BRIM_SIZE:
            self.brim_size_var.set(self.gui.brim_size)
        else:
            self.brim_size_var.set(BRIM_AUTO)

        self.brim_size_box = OptionMenu(
            self, self.brim_size_var, self.brim_size_var.get(), *brim_opts
        )
        self.brim_size_box.grid(row=0, column=3, sticky=W, padx=5, pady=3)

        # purge extrusion multiplier
        purge_multi_values = [100 + val * 5 for val in range(31)]
        self.purge_multi_var = StringVar(self)
        if self.gui.purge_multi:
            if self.gui.purge_multi in purge_multi_values:
                self.purge_multi_var.set(self.gui.purge_multi)
            else:
                self.purge_multi_var.set(110)
        else:
            self.purge_multi_var.set(110)

        self.purge_multi_box = OptionMenu(
            self, self.purge_multi_var, self.purge_multi_var.get(), *purge_multi_values
        )
        self.purge_multi_box.grid(row=1, column=3, sticky=W, padx=5, pady=3)

        # purge extrusion speed
        purge_speed_values = [20 + val * 5 for val in range(16)]
        self.purge_speed_var = StringVar(self)
        if self.gui.purge_speed:
            if self.gui.purge_speed in purge_speed_values:
                self.purge_speed_var.set(self.gui.purge_speed)
            else:
                self.purge_speed_var.set(110)
        else:
            self.purge_speed_var.set(110)

        self.purge_speed_box = OptionMenu(
            self, self.purge_speed_var, self.purge_speed_var.get(), *purge_speed_values
        )
        self.purge_speed_box.grid(row=2, column=3, sticky=W, padx=5, pady=3)

        # fan off
        self.tower_fan_off_var = BooleanVar(self)
        self.tower_fan_off_var.set(self.gui.tower_fan_off)

        self.tower_fan_off_box = Checkbutton(self, variable=self.tower_fan_off_var)
        self.tower_fan_off_box.grid(row=3, column=3, sticky=W, padx=5, pady=3)

        # infill type
        self.infill_style_var = StringVar(self)

        if self.gui.infill_style and self.gui.infill_style in INFILL_STYLES:
            self.infill_style_var.set(self.gui.infill_style)
        else:
            self.infill_style_var.set(INFILL_ZIGZAG)

        self.infill_type_option = OptionMenu(
            self, self.infill_style_var, self.infill_style_var.get(), *INFILL_STYLES
        )
        self.infill_type_option.grid(row=4, column=3, sticky=W, padx=5, pady=3)

    def set_debug(self):
        self.log.enable_debug(self.debug_var.get())


class BottomFrame(Frame):
    """
    Bottom GUI elements frame
    """

    def __init__(self, master, gui):
        super().__init__(master)
        self.gui = gui
        self.grid(row=9)
        self.line_count = 0
        self.create_widgets()

    def create_widgets(self):
        """
        Creates bottom GUI elements
        :return:
        """
        self.scrollbar = Scrollbar(self)
        self.scrollbar.grid(row=3, column=3)

        self.status = Text(self, height=10, width=90, yscrollcommand=self.scrollbar.set)
        self.status.grid(row=3, columnspan=2)

        self.scrollbar.config(command=self.status.yview)
        self.update_status("Idling...")

    def update_status(self, text):
        """
        Update status text element
        :param text: text to add
        :return:
        """
        self.status.configure(state=NORMAL)
        self.status.insert(END, text + os.linesep)
        self.status.configure(state=DISABLED)
        if not self.status.see(END):
            self.scrollbar.set(100, 0)
        self.line_count += 1


class GUI:
    """
    Main GUI class
    """

    def __init__(self):

        self.debug = status.get("debug") == "true"

        self.log = Logger(os.path.join(root_dir, "logs"), debug=self.debug)

        # read values from config
        self.last_hwconfig = status.get("last_hwconfig")
        self.last_position = status.get("last_position")
        try:
            self.last_line_count = int(status.get("last_line_count"))
        except (ValueError, TypeError):
            self.last_line_count = LINE_COUNT_DEFAULT
        try:
            self.raft_multi = int(status.get("raft_multi"))
        except (ValueError, TypeError):
            self.raft_multi = 100
        try:
            self.brim_size = int(status.get("brim_size"))
        except (ValueError, TypeError):
            self.brim_size = BRIM_SIZE[0]

        self.brim_auto = status.get("brim_auto") == "true"
        self.force_raft = status.get("force_raft") == "true"

        try:
            self.purge_multi = int(status.get("purge_multi"))
        except (ValueError, TypeError):
            self.purge_multi = 110

        try:
            self.purge_speed = int(status.get("purge_speed"))
        except (ValueError, TypeError):
            self.purge_speed = 60

        self.tower_fan_off = status.get("tower_fan_off") == "true"

        self.infill_style = status.get("infill_style")

        # OctoPrint values
        self.octoprint_url = status.get("octoprint_url")
        self.octoprint_api_key = status.get("octoprint_api_key")
        self.octoprint_upload_folder = status.get("octoprint_upload_folder")

    def show_gui(self):

        self.top = Tk()
        self.top.title("FilaSwitch v%s" % version)
        # top.geometry('500x500')
        self.top.rowconfigure(9, weight=1)
        self.top.columnconfigure(5, weight=1)

        self.nb = Notebook(self.top)
        self.info = BottomFrame(self.top, self)

        self.log.set_gui(self.info)

        self.topframe = TopFrame(self.log, self.nb, self)

        self.adv_frame = AdvancedFrame(self.log, self.nb, self)
        self.octoprint_frame = OctoPrintFrame(self.log, self.nb, self)

        self.nb.add(self.topframe, text="Main")
        self.nb.add(self.adv_frame, text="Advanced")
        self.nb.add(self.octoprint_frame, text="OctoPrint")
        self.nb.grid(row=0, column=0, columnspan=5, rowspan=5, sticky="NESW")
        self.top.protocol("WM_DELETE_WINDOW", self.quit)
        self.top.mainloop()

    def quit(self):
        self.topframe.update_status()
        utils.save_status_file(status_file, status)
        self.top.destroy()


def main():

    if len(sys.argv) < 2:
        # GUI mode
        gui = GUI()
        gui.show_gui()
    else:

        hw_configs = settings.get_hw_config_names()

        parser = argparse.ArgumentParser()
        parser.add_argument("file", help="Path to g-code file to process")
        parser.add_argument(
            "hw_config", help="Extruder/hotend configuration", choices=hw_configs
        )
        parser.add_argument("--debug", help="Show debug prints", action="store_true")
        parser.add_argument(
            "--lines",
            help="Purge lines to print after filament change",
            type=int,
            default=LINE_COUNT_DEFAULT,
        )
        parser.add_argument(
            "--position",
            help="Purge tower position. Default Auto. Auto will try to find a position with enough free space for the tower",
            choices=TOWER_POSITIONS,
            default=AUTO,
        )
        parser.add_argument(
            "--force_raft",
            help="Forces printing tower raft",
            action="store_true",
        )
        parser.add_argument(
            "--tower_force",
            help="start position of tower, given as x,y",
            type=str,
            default="0,0",
        )
        parser.add_argument(
            "--brim_count", help="Number of brim loops", type=int, default=0
        )
        parser.add_argument(
            "--raft_multi",
            help="Raft extrusion percentage, default 100",
            type=int,
            default=100,
        )
        parser.add_argument(
            "--purge_multi",
            help="Purge extrusion percentage, default 110",
            type=int,
            default=110,
        )
        parser.add_argument(
            "--purge_speed",
            help="Purge extrusion max speed, default 60",
            type=int,
            default=60,
        )
        parser.add_argument(
            "--tower_fan_off",
            help="Turn off fan while printing tower",
            action="store_true",
        )
        parser.add_argument(
            "--infill_style",
            help="Tower infill style",
            choices=INFILL_STYLES,
            default=INFILL_ZIGZAG,
        )
        parser.add_argument("--opurl", help="OctoPrint url for gcode upload", type=str)
        parser.add_argument(
            "--opkey", help="OctoPrint API key for gcode upload", type=str
        )
        parser.add_argument(
            "--opfolder", help="OctoPrint upload folder", type=str, default=""
        )
        parser.add_argument(
            "--opprint",
            help="OctoPrint start print after successful upload",
            action="store_true",
        )

        args = parser.parse_args()

        settings.hw_config = args.hw_config
        settings.purge_lines = args.lines
        settings.tower_position = args.position
        settings.force_raft = args.force_raft
        settings.tower_force = args.tower_force
        settings.raft_multi = args.raft_multi
        settings.purge_multi = args.purge_multi
        settings.purge_speed = args.purge_speed
        settings.tower_fan_off = args.tower_fan_off
        settings.infill_style = args.infill_style

        if args.brim_count:
            settings.brim = args.brim_count

        log = Logger(os.path.join(root_dir, "logs"), gui=False, debug=args.debug)
        print_type = detect_file_type(args.file, log)
        pf = print_type(log, settings)
        result_file = pf.process(args.file)
        log.info("New file saved: %s" % result_file)

        if args.opurl:
            if args.opkey:
                octoprint = OctoPrint(args.opurl, args.opkey, log)
                log.info(
                    "Uploading {} to OctoPrint folder {}, please wait...".format(
                        result_file, args.opfolder
                    )
                )
                up_file = octoprint.upload_file(result_file, args.opfolder)
                log.info("Upload done")
                if args.opprint:
                    log.info("Starting print")
                    octoprint.start_print(up_file)
            else:
                log.warning(
                    "No API key given even though OctoPrint url was given. Cannot upload"
                )


if __name__ == "__main__":
    main()
