@echo off && cd /d "%~dp0" && openfiles >nul 2>&1
if %errorlevel% neq 0 ( echo permission error. & PAUSE & exit /b 0 )

::[export registry]
del /q hkcr.reg >nul 2>&1
del /q hkcu.reg >nul 2>&1
del /q hklm.reg >nul 2>&1
del /q hku.reg >nul 2>&1
del /q hkcc.reg >nul 2>&1
del /q associate.reg >nul 2>&1
reg export "HKCR" hkcr.reg /y
reg export "HKCU" hkcu.reg /y
reg export "HKLM" hklm.reg /y
reg export "HKU" hku.reg /y
reg export "HKCC" hkcc.reg /y
reg export "HKLM\SOFTWARE\Classes\SystemFileAssociations" associate.reg /y
exit /b 0
