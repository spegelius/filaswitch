@echo off

setlocal EnableExtensions EnableDelayedExpansion

set ROOT_DIR=%~dp0

rem Wrapper script for starting filaswitch. Needed in order to support
rem Slic3r automatic post-processing as Slic3r always puts the file path
rem after all commans -> default argument ordering doesn't work

rem switch file and hwconfig argument order

set "ARG1=%1"
set "ARG2=%2"
set "ARG3=%3"
set "ARG4=%4"
set "ARG5=%5"
set "ARG6=%6"

IF NOT DEFINED ARG1 (
    python "%ROOT_DIR%\src\filaswitch.py"
) ELSE IF NOT DEFINED ARG2 (
    python "%ROOT_DIR%\src\filaswitch.py" %ARG1%
) ELSE IF EXIST "%ARG2%" (
    echo 3
    python "%ROOT_DIR%\src\filaswitch.py" %ARG2% %ARG1% %ARG3% %ARG4% %ARG5% %ARG6%
) ELSE (
    python "%ROOT_DIR%\src\filaswitch.py" %ARG1% %ARG2% %ARG3% %ARG4% %ARG5% %ARG6%
)
