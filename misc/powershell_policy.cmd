@echo off && cd /d "%~dp0" && openfiles >nul 2>&1
if %errorlevel% neq 0 ( echo permission error. & PAUSE & exit /b 0 )

::[check powershell]
powershell $host.Version
if %errorlevel% neq 0 ( @echo powershell not installed or not add PATH environment variable setting. & PAUSE & exit /b 0 )

::[chenge policy]
powershell -Command Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
