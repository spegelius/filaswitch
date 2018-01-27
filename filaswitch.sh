#!/bin/bash

# Wrapper script for starting filaswitch. Needed in order to support
# Slic3r automatic post-processing as Slic3r always puts the file path
# after all commans -> default argument ordering doesn't work

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# switch file and hwconfig argument order
if [ ! -z "$2" ] && [ -e "$2" ]; then
  python3 $DIR/src/filaswitch.py "$2" "$1" ${@:3}
elif [ -z "$1" ]; then
  python3 $DIR/src/filaswitch.py
else
  python3 $DIR/src/filaswitch.py ${@}
fi



