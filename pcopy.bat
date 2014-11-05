@echo off

rem :: pcopy.bat
rem :: v1.00, 2014-11-05, 05:43:42 CST
rem :: AUTHOR: Mark R. Gollnick <mark.r.gollnick@gmail.com>
rem :: HOMEPAGE: https://github.com/markgollnick
rem :: DESCRIPTION:
rem ::   For use with pexec.vbs and the iexpress.exe packager.
rem :: USAGE:
rem ::   1. Include pexec.vbs (the "parent executable" locator) and this file,
rem ::      pcopy.bat (the "persistent copy" script), in the iexpress package.
rem ::   2. The install line must be "cmd.exe /c pcopy.bat ..."
rem ::   3. Optional: Replace "..." with a command to run after extraction.
rem ::   4. Done. All other files will be extracted to the current working
rem ::      directory (that is, the directory of the containing EXE). This
rem ::      functionality is not readily available via iexpress.exe itself.

rem :: Initialize
for /F "delims=" %%A in ("%0") do set ARG0=%%~dpnxA
for /F "delims=" %%A in ("%ARG0%") do set THIS=%%~nxA
for /F "delims=" %%A in ("%ARG0%") do set WDIR=%%~dpA
set WDIR=%WDIR:~0,-1%

rem :: Get Origin
for /F "delims=" %%A in ('cscript "%WDIR%\pexec.vbs" 3') do set WDIR=%%~dpA
set WDIR=%WDIR:~0,-1%

rem :: "Extract" Files
del /f /q "pexec.vbs" >NUL 2>&1
xcopy /y * "%WDIR%\"
del /f /q "%WDIR%\pcopy.bat"

rem :: Run Installation/Executable/Script...
cd "%WDIR%"
for /F "delims=" %%A in ("%1") do start "%%~A"
