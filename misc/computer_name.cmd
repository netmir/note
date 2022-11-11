@echo off && cd /d "%~dp0" && openfiles >nul 2>&1
if %errorlevel% neq 0 ( echo permission error. & PAUSE & exit /b 0 )

::[rename workgroup]
::echo [SETUP]WORKGROUP
::set RegistryWorkgroup=%~2
::if not defined RegistryWorkgroup set /P RegistryWorkgroup="WORKGROUP:"
::wmic computersystem where name="%computername%" call joindomainorworkgroup name="%RegistryWorkgroup%"

::[rename computername]
echo [SETUP]COMPUTER NAME
set RegistryName=%~1
if not defined RegistryName set /P RegistryName="COMPUTER NAME:"
wmic computersystem where name="%computername%" call rename name="%RegistryName%"
exit /b 0
