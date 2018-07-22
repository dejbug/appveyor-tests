@echo off
for /f "delims=" %%a in ('python appveyor_mingw.py') do set MINGW_DIR=%%a
echo '%MINGW_DIR%'
