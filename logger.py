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

    def debug(self, msg):
        self.log.debug(msg)

    def error(self, msg):
        self.log.error(msg)
        if self.gui:
            self.gui.update_status(msg)

    def info(self, msg):
        self.log.info(msg)
        if self.gui:
            self.gui.update_status(msg)

    def warning(self, msg):
        self.log.warning(msg)