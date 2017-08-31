@ECHO OFF

GOTO TEST_1
GOTO :EOF

:TEST_1
IF NOT EXIST build MKDIR build
PUSHD build
COPY ..\src\print_file_system_info.py .
python print_file_system_info.py
POPD
GOTO :EOF

:TEST_2
cinst winflexbison
DIR /S /B C:\ProgramData\chocolatey\lib\winflexbison
GOTO :EOF
