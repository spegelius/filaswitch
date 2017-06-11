import os


def is_windows():
    """ Check if OS is Windows"""
    win = ['nt']
    if os.name in win:
        return True
    return False