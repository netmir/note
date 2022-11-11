@echo off && cd /d "%~dp0" && openfiles >nul 2>&1
if %errorlevel% neq 0 ( echo permission error. & PAUSE & exit /b 0 )

powershell $host.Version >nul
if %errorlevel% neq 0 ( echo ** powershell not installed or not add PATH environment variable setting ** & exit /b )

setlocal
call set SCRIPT_FILE=%~n0.ps1
echo. >"%SCRIPT_FILE%"

::[the package name includes Microsoft.*]
call :ADD *Microsoft.3DBuilder*
call :ADD *Microsoft.Appconnector*
call :ADD *Microsoft.bing*
call :ADD *Microsoft.BingNews*
call :ADD *Microsoft.CommsPhone*
call :ADD *Microsoft.DesktopAppInstaller*
call :ADD *Microsoft.GetHelp*
call :ADD *Microsoft.Getstarted*
call :ADD *Microsoft.Microsoft3DViewer*
call :ADD *Microsoft.MicrosoftOfficeHub*
call :ADD *Microsoft.MicrosoftSolitaireCollection*
call :ADD *Microsoft.MixedReality.Portal*
call :ADD *Microsoft.MSPaint*
call :ADD *Microsoft.Office.OneNote* 
call :ADD *Microsoft.Office.Sway* 
call :ADD *Microsoft.OneConnect* 
call :ADD *Microsoft.OneDrive* 
call :ADD *Microsoft.Paint* 
call :ADD *Microsoft.People* 
call :ADD *Microsoft.PowerAutomate* 
call :ADD *Microsoft.Print3D* 
call :ADD *Microsoft.ScreenSketch* 
call :ADD *Microsoft.StorePurchaseApp* 
call :ADD *Microsoft.Todo* 
call :ADD *Microsoft.Wallet* 
call :ADD *Microsoft.Windows.PeopleExperienceHost* 
call :ADD *Microsoft.Windows.Photos* 
call :ADD *Microsoft.WindowsCalculator* 
call :ADD *Microsoft.WindowsFeedbackHub* 
call :ADD *Microsoft.windowsmaps* 
call :ADD *Microsoft.WindowsPhone* 
call :ADD *Microsoft.WindowsSoundRecorder* 
call :ADD *Microsoft.YourPhone* 
call :ADD *Microsoft.Zune* 
call :ADD *MicrosoftStickyNotes* 
call :ADD *Microsoft.549981C3F5F10 

::[if you have Xbox-Controller, not uninstall.]
::call :ADD *Microsoft.XboxApp* 
::call :ADD *Microsoft.XboxGameOverlay* 
::call :ADD *Microsoft.XboxIdentityProvider* 
::call :ADD *Microsoft.XboxSpeechToTextOverlay* 

::[the package name except Microsoft.*]
call :ADD *Camera* 
call :ADD *Clipchamp* 
call :ADD *communi* 
call :ADD *Dolby* 
call :ADD *Fitbit* 
call :ADD *king.com* 
call :ADD *messaging* 
call :ADD *phone* 
call :ADD *skype* 
call :ADD *soundrec* 
call :ADD *Spotify* 
call :ADD *SpotifyAB* 
call :ADD *windowsalarms* 
call :ADD 828B5831.HiddenCityMysteryofShadows 
call :ADD 89006A2E.AutodeskSketchBook 
call :ADD A278AB0D.DisneyMagicKingdoms 
call :ADD A278AB0D.MarchofEmpires 

call :RUN
del /Q "%~n0.ps1"
exit /b 0

:ADD
echo Get-AppxPackage -allusers %* ^| Remove-AppxPackage >>"%SCRIPT_FILE%"
exit /b

:RUN
powershell $host.Version >nul
if %errorlevel% neq 0 ( echo ** powershell not installed or not add PATH environment variable setting ** & exit /b )
powershell -ExecutionPolicy RemoteSigned -File "%SCRIPT_FILE%"
exit /b
