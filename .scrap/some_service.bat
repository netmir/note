@cd /d "%~dp0" && @openfiles >nul 2>&1
@if %errorlevel% neq 0 ( @echo permission error. & PAUSE & exit /b 0 )

::[disbale windows feature]
dism /Online /Disable-Feature:Printing-PrintToPDFServices-Features
dism /Online /Disable-Feature:Printing-XPSServices-Features
dism /Online /Disable-Feature:SearchEngine-Client-Package
dism /Online /Disable-Feature:MSRDC-Infrastructure
dism /Online /Disable-Feature:Printing-Foundation-Features
dism /Online /Disable-Feature:Printing-Foundation-InternetPrinting-Client
dism /Online /Disable-Feature:NetFx4-AdvSrvs
dism /Online /Disable-Feature:WCF-Services45
dism /Online /Disable-Feature:WCF-TCP-PortSharing45
dism /Online /Disable-Feature:MediaPlayback
dism /Online /Disable-Feature:WindowsMediaPlayer
dism /Online /Disable-Feature:Internet-Explorer-Optional-amd64
dism /Online /Disable-Feature:WorkFolders-Client
dism /Online /Disable-Feature:MicrosoftWindowsPowerShellV2Root
dism /Online /Disable-Feature:MicrosoftWindowsPowerShellV2
:::dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
:::dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
:::wsl --set-default-version 2

::[enable service]
sc config Dhcp start= auto
sc config Dnscache start= auto

::[disable service]
set SERVICE[1]=SSDPSRV
set SERVICE[2]=LanmanServer
set SERVICE[3]=SstpSvc
set SERVICE[4]=SEMgrSvc
set SERVICE[5]=Spooler
set SERVICE[6]=fdPHost
set SERVICE[7]=FDResPub
:::set SERVICE[8]=XboxGipSvc
:::set SERVICE[9]=XblAuthManager
:::set SERVICE[10]=XblGameSave
:::set SERVICE[11]=XboxNetApiSvc

set I=1
:FOREACH_SERVICE
call set SERVICE=%%SERVICE[%I%]%%
if not defined SERVICE ( goto SERVICE_EXIT )
net stop %SERVICE% /y
sc config %SERVICE% start= disabled
set /a I=%I% + 1
goto FOREACH_SERVICE
:SERVICE_EXIT

::[disable Cortana]
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t reg_dword /d "0" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t reg_dword /d "0" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /t reg_dword /d "1" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t reg_dword /d "0" /f

::[disable FindMyDevice]
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\FindMyDevice" /v AllowFindMyDevice /t reg_dword /d "0" /f

::[disable Insider Preview]
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v AllowBuildPreview  /t reg_dword /d "0" /f

::[disable setting]
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v AutoDownloadAndUpdateMapData /t reg_dword /d "0" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v AllowUntriggeredNetworkTrafficOnSettingsPage /t reg_dword /d "0" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v PreventNetworkTrafficPreUserSignIn /t reg_dword /d "1" /f
REG ADD "HKLM\SOFTWARE\SOFTWARE\Microsoft\OneDrive" /v AllowFindMyDevice /t reg_dword /d "0" /f

::[disable NotifyIMEJP]
REG ADD "HKU\.DEFAULT\Software\Microsoft\IME\15.0\IMEJP\MSIME" /v ShowImeModeNotification /t reg_dword /d "0" /f
REG ADD "HKCU\Software\Microsoft\IME\15.0\IMEJP\MSIME" /v ShowImeModeNotification /t reg_dword /d "0" /f

::[disable Search_web_results]
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v AllowSearchToUseLocation /t reg_dword /d "0" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t reg_dword /d "0" /f

::[clean AnyCode Context]
REG DELETE "HKCR\Directory\Background\shell\AnyCode" /f
REG DELETE "HKCR\Directory\shell\AnyCode" /f

::[clean Pin to Taskbar Context]
REG DELETE "HKCR\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" /f

::[clean IntelHD Context]
REG DELETE "HKCR\Directory\Background\shellex\ContextMenuHandlers\igfxcui" /f
REG DELETE "HKCR\Directory\Background\shellex\ContextMenuHandlers\igfxDTCM" /f
REG DELETE "HKCR\Directory\Background\shellex\ContextMenuHandlers\igfxOSP" /f

::[restart explorer]
taskkill /f /im explorer.exe
start explorer.exe
explorer /n ,/root, "%~dp0"
exit /b 0
