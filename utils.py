import os


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
                line = line.strip("\n")
                if line:
                    vals = line.split(":")
                    status[vals[0]] = vals[1]
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
    elif value > 0 and value < limit:
        return True
    elif value < 0 and value > -limit:
        return True
    return False


if __name__ == "__main__":
    save_status_file(".teststatus", {"data1": "dtaa"})
    print(load_status(".teststatus"))