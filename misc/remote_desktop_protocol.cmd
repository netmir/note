@echo off && cd /d "%~dp0" && openfiles >nul 2>&1
if %errorlevel% neq 0 ( echo permission error. & PAUSE & exit /b 0 )

::[enable remote]
if [%1] equ [0] ( call :ENABLE & exit /b 0 )
if [%1] equ [1] ( call :DISABLE & exit /b 0 )
if [%1] equ [on] ( call :ENABLE & exit /b 0 )
if [%1] equ [off] ( call :DISABLE & exit /b 0 )
if [%1] equ [sts] ( call :STATUS & exit /b 0 )
call :USAGE
exit /b 0


:STATUS
echo INFO: fDenyTSConnections (0:Enable RDP / 1:Disable RDP)
REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections
exit /b

:ENABLE
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t reg_dword /d "0" /f
exit /b

:DISABLE
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t reg_dword /d "1" /f
exit /b

:USAGE
echo USAGE: %~nx0 [on/off/sts]
exit /b
