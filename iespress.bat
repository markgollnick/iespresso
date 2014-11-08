@echo off

for /F "delims=" %%A in ("%0") do set ARG0=%%~dpnxA
for /F "delims=" %%A in ("%ARG0%") do set THIS=%%~nxA
for /F "delims=" %%A in ("%ARG0%") do set WDIR=%%~dpA
set WDIR=%WDIR:~0,-1%

for /F "delims=" %%A in ('cscript "%WDIR%\pexec.vbs" 3') do set WDIR=%%~dpA
set WDIR=%WDIR:~0,-1%

xcopy /y * "%WDIR%\" /EXCLUDE:pcopy.bat+pexec.vbs

cd "%WDIR%"
for /F "delims=" %%A in ("%1") do start "%%~A"
