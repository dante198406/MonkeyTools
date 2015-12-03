set DIR=%~sdp0
echo %DIR%
adb logcat -b system -v time > system.log 2>&1 &