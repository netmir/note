@echo off & cd /d "%~dp0"

set ENVDIR[1]=%USERPROFILE%
set ENVDIR[2]=%LOCALAPPDATA%
set ENVDIR[3]=%LOCALAPPDATA%\Programs
set ENVDIR[4]=%APPDATA%
set ENVDIR[5]=%APPDATA%\Microsoft\Windows\SendTo
set ENVDIR[6]=%APPDATA%\Microsoft\Windows\Start Menu\Programs
set ENVDIR[7]=%PROGRAMDATA%
set ENVDIR[8]=%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs

set I=1
:FOREACH_ENVDIR
call set ENVDIR=%%ENVDIR[%I%]%%
if not defined ENVDIR ( goto FOREACH_EXIT )
if exist "%ENVDIR%\" ( echo [+] %ENVDIR% ) else ( echo [-] %ENVDIR% )
set /a I=%I% + 1
goto FOREACH_ENVDIR
:FOREACH_EXIT

PAUSE
exit /b 0
