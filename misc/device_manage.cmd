@echo off && cd /d "%~dp0" && openfiles >nul 2>&1
if %errorlevel% neq 0 ( echo permission error. & PAUSE & exit /b 0 )

::[main]
setlocal
call :USAGE
call set NAME=%1
call set CLASS=%2
if not defined NAME call set NAME=*
if defined CLASS call set CLASS=-Class '%CLASS%'
call set SCRIPT_FILE=%~n0.ps1
echo. >"%SCRIPT_FILE%"
if [%1] equ [] call :LIST
if [%1] neq [] call :DISABLE
call :RUN
del /Q "%~n0.ps1"
exit /b 0

:DISABLE
::[write script]
echo echo Get-PnpDevice -PresentOnly %CLASS% -FriendlyName '%NAME%' >>"%SCRIPT_FILE%"
echo $Device = Get-PnpDevice -PresentOnly %CLASS% -FriendlyName '%NAME%' >>"%SCRIPT_FILE%"
echo $Device ^| Disable-PnpDevice -Confirm:$false  >>"%SCRIPT_FILE%"
echo $Device = Get-PnpDevice -PresentOnly %CLASS% -FriendlyName '%NAME%' >>"%SCRIPT_FILE%"
echo $Device >>"%SCRIPT_FILE%"
exit /b 0

:LIST
::[write script]
echo echo Get-PnpDevice -PresentOnly >>"%SCRIPT_FILE%"
echo Get-PnpDevice -PresentOnly >>"%SCRIPT_FILE%"
exit /b

:RUN
::[run script]
echo ================================================================================
powershell $host.Version >nul
if %errorlevel% neq 0 ( echo ** powershell not installed or not add PATH environment variable setting ** & exit /b )
powershell -ExecutionPolicy RemoteSigned -File "%SCRIPT_FILE%"
echo ================================================================================
exit /b

:USAGE
::[USAGE]
echo USAGE:
echo   %~nx0 ^<name^> ^<class^>
echo.
echo DETAILS:
echo   %~nx0                : [PS] 
echo   %~nx0 ^<name^>         : [PS] Get-PnpDevice -PresentOnly -FriendlyName '^<name^>' ^| Disable-PnpDevice
echo   %~nx0 ^<name^> ^<class^> : [PS] Get-PnpDevice -PresentOnly -Class '^<class^>' -FriendlyName '^<name^>' ^| Disable-PnpDevice
exit /b

::[Reference]
:: https://learn.microsoft.com/en-us/powershell/module/pnpdevice/disable-pnpdevice?view=windowsserver2019-ps
:: https://learn.microsoft.com/en-us/powershell/module/pnpdevice/get-pnpdevice?view=windowsserver2019-ps
