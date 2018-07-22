@echo off
for /f "delims=" %%a in ('python appveyor_mingw.py') do set MINGW_DIR=%%a
rem echo '%MINGW_DIR%'
if "."=="%MINGW_DIR%" (
	set ERRORLEVEL=1
) else (
	set ERRORLEVEL=0
	echo %MINGW_DIR%
)
