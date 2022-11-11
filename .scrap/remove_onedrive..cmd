@cd /d "%~dp0" && @openfiles >nul 2>&1
@if %errorlevel% neq 0 ( @echo permission error. & PAUSE & exit /b 0 )
::** Deprecated **
::[Reason]
::This method is old of Windows 10.
::Windows 11 then uninstall AppxPackage. Is it really?

::[clean OneDrive]
tasklist | find "OneDrive.exe" > nul
if %errorlevel% equ 0 (
  taskkill /f /im OneDrive.exe
  "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall
)

rd "%USERPROFILE%\OneDrive" /q /s
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /q /s
rd "%PROGRAMDATA%\Microsoft OneDrive" /q /s
rd "%SYSTEMDRIVE%\OneDriveTemp" /q /s
REG DELETE "HKCU\Environment" /v "OneDrive" /f
REG DELETE "HKCU\Environment" /v "OneDriveConsumer" /f
exit /b 0
