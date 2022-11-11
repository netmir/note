@echo off && cd /d "%~dp0" && openfiles >nul 2>&1
if %errorlevel% neq 0 ( echo permission error. & PAUSE & exit /b 0 )

echo [LIST]ZoneMap
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges" /s /f ":Range"

echo [SETUP]ZoneMap
set /P RegistryIP="IPv4(xxx.xxx.xxx.xxx) :"

::[enable zone map]
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v ":Range" /t reg_sz /d "%RegistryIP%%" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v "http" /t reg_dword /d "1" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v "file" /t reg_dword /d "1" /f

::[restart explorer (apply with reload explorer)]
taskkill /f /im explorer.exe
start explorer.exe
explorer /n ,/root, "%~dp0"
exit /b 0
