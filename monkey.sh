#!/bin/sh
adb logcat -v time *:E > mainLog.log;
adb shell monkey  --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v  --throttle 100 2200 >/home/zhangzhaolei/tmp/monkey_info.log
