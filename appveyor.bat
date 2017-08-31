GOTO TEST_1
GOTO :EOF

:TEST_1
IF NOT EXIST build MKDIR build
python src\print_file_system_info.py > build\print_file_system_info.out.txt
GOTO :EOF

:TEST_2
cinst winflexbison
DIR /S /B C:\ProgramData\chocolatey\lib\winflexbison
GOTO :EOF
