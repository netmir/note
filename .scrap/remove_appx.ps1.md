I don't have update plans of this file.
REASON:[2022-10-13] I rewrite to batch file(*.cmd)
===

# Remove Windows11 Pre-install Appx (PowerShell)

Run the following in Command prompt (require administrator).

[CMD] `powershell ***.ps1`
 
If SecurityError occurs in running `***.ps1`, run the following command in PowerShell to changed the policy setting.

[PS] `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

Or, if you do not change the setting, add arguments at the command prompt. (Do not change the settings, apply policy temporarily.)

[CMD] `powershell -ExecutionPolicy RemoteSigned -File ***.ps1`

If you want to get a list of installed packages, run the following command in PowerShell.
  `Get-AppxPackage * | Select-Object -Property Name,PackageFullName | Out-File -FilePath AppxPackageList.txt -Encoding UTF8`


## PowerShell Command List
## The package name includes Microsoft.*
~~~
Get-AppxPackage -allusers *Microsoft.3DBuilder* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Appconnector* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.bing* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.BingNews* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.CommsPhone* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.DesktopAppInstaller* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.GetHelp* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Getstarted* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Microsoft3DViewer* |  Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.MixedReality.Portal* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.MSPaint* |  Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Office.OneNote* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Office.Sway* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.OneConnect* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.OneDrive* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Paint* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.People* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.PowerAutomate* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Print3D* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.ScreenSketch* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.StorePurchaseApp* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Todo* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Wallet* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Windows.PeopleExperienceHost* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Windows.Photos* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WindowsCalculator* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.windowsmaps* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WindowsPhone* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.YourPhone* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.Zune* | Remove-AppxPackage
Get-AppxPackage -allusers *MicrosoftStickyNotes* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.549981C3F5F10 | Remove-AppxPackage
~~~

## If you have Xbox-Controller, not uninstall.
~~~
Get-AppxPackage -allusers *Microsoft.XboxApp* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.XboxGameOverlay* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.XboxIdentityProvider* | Remove-AppxPackage
Get-AppxPackage -allusers *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage
~~~

## The package name except Microsoft.*
~~~
Get-AppxPackage -allusers *Camera* | Remove-AppxPackage
Get-AppxPackage -allusers *Clipchamp* | Remove-AppxPackage
Get-AppxPackage -allusers *communi* | Remove-AppxPackage
Get-AppxPackage -allusers *Dolby* | Remove-AppxPackage
Get-AppxPackage -allusers *Fitbit* | Remove-AppxPackage
Get-AppxPackage -allusers *king.com* | Remove-AppxPackage
Get-AppxPackage -allusers *messaging* | Remove-AppxPackage
Get-AppxPackage -allusers *phone* | Remove-AppxPackage
Get-AppxPackage -allusers *skype* | Remove-AppxPackage
Get-AppxPackage -allusers *soundrec* | Remove-AppxPackage
Get-AppxPackage -allusers *Spotify* | Remove-AppxPackage
Get-AppxPackage -allusers *SpotifyAB* | Remove-AppxPackage
Get-AppxPackage -allusers *windowsalarms* | Remove-AppxPackage
Get-AppxPackage -allusers 828B5831.HiddenCityMysteryofShadows | Remove-AppxPackage
Get-AppxPackage -allusers 89006A2E.AutodeskSketchBook | Remove-AppxPackage
Get-AppxPackage -allusers A278AB0D.DisneyMagicKingdoms | Remove-AppxPackage
Get-AppxPackage -allusers A278AB0D.MarchofEmpires | Remove-AppxPackage
~~~

[Reference]
https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_execution_policies
https://learn.microsoft.com/powershell/module/microsoft.powershell.security/set-executionpolicy
