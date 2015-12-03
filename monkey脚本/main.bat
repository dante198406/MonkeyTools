set DIR=%~sdp0
echo %DIR%
adb logcat -b main -v time > main.log 2>&1 &