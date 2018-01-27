@echo off

set ROOT_DIR=%~dp0

rem Wrapper script for starting filaswitch. Needed in order to support
rem Slic3r automatic post-processing as Slic3r always puts the file path
rem after all commans -> default argument ordering doesn't work

rem switch file and hwconfig argument order
IF "%1%"=="" (
    python "%ROOT_DIR%\src\filaswitch.py"
) ELSE IF "%2%"=="" (
    python "%ROOT_DIR%\src\filaswitch.py" "%1"
) ELSE IF EXIST "%2%" (
    python "%ROOT_DIR%\src\filaswitch.py" "%2" %1 %3 %4 %5 %6
) ELSE (
    python "%ROOT_DIR%\src\filaswitch.py" "%1" %2 %3 %4 %5 %6
)
