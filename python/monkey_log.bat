@ECHO OFF
ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                 Monkey Test                 ::
ECHO.::               by zhangzhaolei               ::
ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.[ INFO ] 准备Monkey测试
 
REM 获取日期,格式为：20150608
SET c_date=%date:~0,4%%date:~5,2%%date:~8,2%
REM 获取得小时,格式为：24小时制，10点前补0
SET c_time=%time:~0,2%
    IF /i %c_time% LSS 10 (
SET c_time=0%time:~1,1%
)
REM 组合小时、分、秒，格式为: 131420
SET c_time=%c_time%%time:~3,2%%time:~6,2%
REM 将当运行时间点做为日志文件名
SET logfilename=%c_date%%c_time%
 
 
REM 创建当天日期目录及测试APP日志保存目录
IF NOT EXIST %~dp0\%c_date%    md %~dp0\%c_date%
SET logdir="%~dp0\%c_date%\"
IF NOT EXIST %logdir% (
    ECHO.[ Exec ] 创建目录：%c_date%
    md %logdir%
)
 
ECHO.
ECHO.[ Exec ] 清空Phone中log
adb logcat -c

ECHO.
ECHO.[ INFO ] 开始执行Monkey命令
REM 强制关闭准备测试的APP
REM adb shell am force-stop %packageName%
 
:::::::::::::::::Monkey测试命令::::::::::::::::::::::::
::::::::::::修改策略请仅在此区域内修改:::::::::::::::::
ECHO.[ Exec ] adb shell monkey -p com.android.settings -s %c_time%  --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 100 100

adb shell monkey -p com.android.settings -s %c_time% --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 100 100>%logdir%\%logfilename%_monkey.log
 
::::::::::::修改策略请仅在此区域内修改:::::::::::::::::
::::::::::::::::::::::END::::::::::::::::::::::::::::::
ECHO.[ INFO ] 执行Monkey命令结束
ECHO.
 
ECHO.
ECHO.[ Exec ] 使用Logcat导出日志
adb logcat -d >%logdir%\%logfilename%_main.log
 
:EXIT
ECHO.
ECHO.[ INFO ] 请按任意键关闭窗口...
PAUSE>nul
