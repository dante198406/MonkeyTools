#!/bin/sh

#monkey -p com.android.dialer --pct-syskeys 0 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-#trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 500 1200000000

monkey --pct-syskeys 0 --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 500 1200000000
