#!/usr/bin/python
# -*- coding: utf-8 -*-

import os, sys, re, xml.dom.minidom

#TEMP_PATH = ".temp"
#FILENAME_SVN_LOG = "svn_log.xml"

#reload(sys)
#sys.setdefaultencoding('utf-8')

os.system("adb shell monkey  --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v  --throttle 100 2200 >/home/zhangzhaolei/tmp/monkey_info.log")

os.system("adb logcat -v time *:E > mainLog.log")
#	print "OK"
