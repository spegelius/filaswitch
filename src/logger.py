import logging
import os
import sys


class Logger:

    def __init__(self, logdir, gui=None, debug=False):
        self.logdir = logdir
        self.gui = gui
        self.fmt = logging.Formatter(fmt="%(asctime)s - %(name)s - %(levelname)s - %(message)s")
        self.filehandler = logging.FileHandler(os.path.join(logdir, "filaswitch.log"))
        self.filehandler.setFormatter(self.fmt)
        self.streamhandler = logging.StreamHandler(stream=sys.stdout)
        self.streamhandler.setFormatter(self.fmt)
        self.log = logging.getLogger("filaswitch")
        self.log.setLevel(logging.INFO)
        self.log.addHandler(self.filehandler)
        self.log.addHandler(self.streamhandler)

        self._debug = debug
        if self._debug:
            self.log.setLevel(logging.DEBUG)
        else:
            self.log.setLevel(logging.INFO)

    def debug(self, msg, *args, **kwargs):
        self.log.debug("DEBUG: %s" % msg, *args, **kwargs)

    def error(self, msg, *args, **kwargs):
        self.log.error(msg, *args, **kwargs)
        if self.gui:
            self.gui.update_status("ERROR: %s" % msg)

    def info(self, msg, *args, **kwargs):
        self.log.info(msg, *args, **kwargs)
        if self.gui:
            self.gui.update_status(msg)

    def warning(self, msg, *args, **kwargs):
        self.log.warning(msg, *args, **kwargs)
        if self.gui:
            self.gui.update_status("WARNING: %s" % msg)

    def set_gui(self, gui):
        self.gui = gui

    def exception(self, msg, *args, exc_info: bool = True, **kwargs):
        self.log.exception(msg, *args, exc_info=exc_info, **kwargs)
        if self.gui:
            self.gui.update_status("ERROR: %s" % msg)

    def enable_debug(self, state):
        if state:
            self.log.setLevel(logging.DEBUG)
        else:
            self.log.setLevel(logging.INFO)