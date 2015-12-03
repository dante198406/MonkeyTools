#!/bin/sh

#adb logcat -b system -v time > system.log 2>&1 &
#adb logcat -b main -v time > main.log& 2>&1 &
#adb logcat -v time *:E > errorLog.log 2>&1 &
#adb logcat -b radio -v time -f %s > radio.log 2>&1 &
#adb logcat -b events -v time -f %s > events.log 2>&1 &
#adb logcat -v time *:E > $(date -d "today" +"%Y%m%d_%H%M%S")_errorLog.log 2>&1 &

adb logcat -c
mkdir $(date -d "today" +"%Y%m%d")

if [ $? -eq 0 ];then
   cd $(date -d "today" +"%Y%m%d")
   if [ $? -eq 0 ];then
       adb logcat -b main -v time > $(date -d "today" +"%Y%m%d_%H%M%S")_main.log 2>&1 &
       adb logcat -b radio -v time > $(date -d "today" +"%Y%m%d_%H%M%S")_radio.log 2>&1 &
       adb logcat -b system -v time > $(date -d "today" +"%Y%m%d_%H%M%S")_system.log 2>&1 &
       adb logcat -b events -v time > $(date -d "today" +"%Y%m%d_%H%M%S")_events.log 2>&1 &
       adb logcat -v time *:E > $(date -d "today" +"%Y%m%d_%H%M%S")_errorLog.log 2>&1 &
       # 此处可以修改monkey的命令
       adb shell monkey --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 100 1200 > $(date -d "today" +"%Y%m%d_%H%M%S")_monkey.log 2>&1 &
   else
       echo "Failed to access target path!"
   fi
else
   echo "Failed to create target！"
fi

