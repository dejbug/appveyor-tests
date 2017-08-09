python src\print_file_system_info.py

EXIT

@ECHO off

ECHO -- [ running ] "stage: prepare"

ECHO -- setting MINGW paths
SET MINGW_BIN=C:\mingw-w64\i686-5.3.0-posix-dwarf-rt_v4-rev0\mingw32\bin
SET PATH=%MINGW_BIN%;%PATH%

ECHO -- renaming mingw32-make.exe in-place
PUSHD %MINGW_BIN%
RENAME mingw32-make.exe make.exe
POPD

ECHO -- [ running ] "stage: build"

ECHO -- selecting build target
IF "%APPVEYOR_REPO_TAG%"=="true" GOTO build_release
IF "%APPVEYOR_REPO_TAG%"=="false" GOTO build_debug
ECHO [ ERROR ] invalid build type
GOTO :EOF

:build_debug

ECHO -- building for debug
make TARGET=debug WINFLAGS=

GOTO run_test

:build_release

ECHO -- building for release
make TARGET=release WINFLAGS=

ECHO -- writing release.txt
ECHO %APPVEYOR_PROJECT_NAME%-%APPVEYOR_REPO_TAG_NAME%.zip > build\release.txt

ECHO -- packing output to deploy
IF NOT EXIST deploy MKDIR deploy
7z a deploy\%APPVEYOR_PROJECT_NAME%-%APPVEYOR_REPO_TAG_NAME%.zip build\*

DIR deploy

:run_test


GOTO :EOF
