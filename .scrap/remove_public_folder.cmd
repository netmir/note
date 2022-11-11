@cd /d "%~dp0" && @openfiles >nul 2>&1
@if %errorlevel% neq 0 ( @echo permission error. & PAUSE & exit /b 0 )
::** Deprecated **
::[Reason]
::Maybe the "Public Folder" is set shared.

::[clean Public]
rd /Q /S "%PUBLIC%"
del /Q /A:H  "C:\Users\desktop.ini"
exit /b 0
