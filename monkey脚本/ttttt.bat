 
REM adb logcat -b system -v time > system.log 2>&1 &
REM adb logcat -b main -v time > main.log& 2>&1 &

set DIR=%~sdp0
echo %DIR%

call %~sdp0\main.bat;call DIR\system.bat
REM call DIR\system.bat
REM call C:\Users\Administrator\Desktop\monkey½Å±¾\system.bat

PAUSE