import math
import os

import math
import functools


def is_windows():
    """
    Check if OS is Windows
    """
    win = ['nt']
    if os.name in win:
        return True
    return False


def load_status(status_file):
    """
    Load status data from file
    :param status_file: file path
    :return:
    """
    try:
        status = {}
        with open(status_file, 'r') as sf:
            for line in sf.readlines():
                line = line.strip()
                if line.startswith("#"):
                    continue
                line = line.strip("\n")
                if line:
                    values = line.split(":", 1)
                    status[values[0]] = values[1].strip()
    except FileNotFoundError:
        return {}
    except Exception as e:
        print(e)
        raise IOError("Cannot open file %s" %status_file)
    return status


def save_status_file(status_file: str, status: dict):
    """
    Write status data to file
    :param status_file: file path
    :param status: status dict
    :return: none
    """
    try:
        if os.path.exists(status_file):
            os.remove(status_file)

        with open(status_file, 'w') as sf:
            sf.writelines(["%s:%s\n" %(key, val) for key, val in status.items()])
    except Exception as e:
        print(e)
        raise


def is_float_zero(value: float, accuracy: int):
    """
    Checks if given float value is zero
    :param value: float value
    :param accuracy: decimals to use for the check
    :return: true or false
    """
    limit = 0.1**accuracy
    if value == 0.0:
        return True
    elif 0 < value < limit:
        return True
    elif -limit < value < 0:
        return True
    return False


def extrusion_feed_rate(extrusion_w, layer_h, filament_d):
    """
    Calculate extrusion feed rate
    :param: extrusion_w: extrusion width
    :param: layer_h: layer height
    :param: filament_d: filament diameter
    :return:
    """
    f_vol = math.pi*(filament_d/2)*(filament_d/2)
    e_vol = layer_h * extrusion_w
    return e_vol/f_vol


def http_or_https(url: str):
    """
    Check url protocol; http or https
    :param url: url
    :return: http or https
    """
    if url.lower().startswith("https:"):
        return "https"
    return "http"


## {{{ http://code.activestate.com/recipes/511478/ (r1)
def percentile(N, percent, key=lambda x:x):
    """
    Find the percentile of a list of values.

    @parameter N - is a list of values. Note N MUST BE already sorted.
    @parameter percent - a float value from 0.0 to 1.0.
    @parameter key - optional key function to compute value from each element of N.

    @return - the percentile of the values
    """
    if not N:
        return None
    k = (len(N)-1) * percent
    f = math.floor(k)
    c = math.ceil(k)
    if f == c:
        return key(N[int(k)])
    d0 = key(N[int(f)]) * (c-k)
    d1 = key(N[int(c)]) * (k-f)
    return d0+d1

# median is 50th percentile.
median = functools.partial(percentile, percent=0.5)
## end of http://code.activestate.com/recipes/511478/ }}}


if __name__ == "__main__":
    save_status_file(".teststatus", {"data1": "dtaa"})
    print(load_status(".teststatus"))
