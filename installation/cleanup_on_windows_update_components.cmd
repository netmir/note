@echo off && cd /d "%~dp0" && openfiles >nul 2>&1
if %errorlevel% neq 0 ( echo permission error. & PAUSE & exit /b 0 )
:: Q. Why try "sfc" for twice?
:: A. Recovery for DISM for the 1st time, recovery with cleanup-image for the 2nd time.
::    If DISM isn't broken, Unneeded the 1st time(before run DISM).

::[recovery DISM]
sfc /scannow
::[cleanup on windows update component]
DISM /Online /Cleanup-image /StartComponentCleanup /ResetBase
DISM /Online /Cleanup-image /SPSuperseded
DISM /Online /Cleanup-Image /RestoreHealth
::[recovery system file]
sfc /scannow
exit /b 0
