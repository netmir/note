@if(0)==(0) ECHO OFF
setlocal
set SRC=%~1
set DST=%~2
if not defined SRC (call :USAGE && exit /b 0)
if not defined DST (call :USAGE && exit /b 0)
if not exist "%SRC%" (echo no exist source&& exit /b 0)
if exist "%DST%.lnk" (echo already exist destination&& exit /b 0)
cscript.exe //nologo //E:JScript "%~f0" "%DST%.lnk" "%SRC%"
goto :EOF
:USAGE
echo USAGE: %~nx0 [source] [target]
exit /b
@end

var lnkPath = WScript.Arguments(0);
var tgtPath = WScript.Arguments(1);
var shell = WScript.CreateObject("WScript.Shell").CreateShortcut(lnkPath);
shell.TargetPath = tgtPath;
shell.Save();

WScript.echo(lnkPath + " >> " + tgtPath);
