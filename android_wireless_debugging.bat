@echo off
cd C:\Users\%USERNAME%\AppData\Local\Android\sdk\platform-tools

adb disconnect

:listen
adb devices
adb tcpip 5555

if %ERRORLEVEL% gtr 0 echo Please try again. & pause & goto :listen

set /p ipaddress=Enter IP Address:
call :connect  %ipaddress%

:connect
adb connect %~1
if %ERRORLEVEL% gtr 0 echo Please try again. & pause & goto :connect
pause
exit