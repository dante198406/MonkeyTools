@ECHO OFF
ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                 Monkey Test                 ::
ECHO.::               by zhangzhaolei               ::
ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

IF NOT EXIST %~sdp0\config.conf GOTO EXIT
ECHO.[ INFO ] 准备Monkey测试
ECHO.[ INFO ] 读取config.conf中信息
 
REM 从配置文件中获得包名
FOR /F "tokens=1,2 delims==" %%a in (config.conf) do (
    IF %%a == packageName SET packageName=%%b
    IF %%a == appEnName SET appEnName=%%b
    IF %%a == appversion SET appversion=%%b
)
 
REM 获取日期,格式为：20150608
SET c_date=%date:~0,4%%date:~5,2%%date:~8,2%

SET c_time=%time:~0,2%
    IF /i %c_time% LSS 10 (
SET c_time=0%time:~1,1%
)
REM 组合小时、分、秒，格式为: 131420
SET c_time=%c_time%%time:~3,2%%time:~6,2%
REM 将当运行时间点做为日志文件名
SET logfilename=%c_date%%c_time%
 
 
REM 创建当天日期目录及测试APP日志保存目录
IF NOT EXIST %~sdp0\%c_date%    md %~sdp0\%c_date%
SET logdir="%~sdp0\%c_date%\%appEnName%%appversion%"
IF NOT EXIST %logdir% (
    ECHO.[ Exec ] 创建目录：%c_date%\%appEnName%%appversion%
    md %logdir%
)
 
ECHO.
ECHO.[ Exec ] 清空Phone中log
adb logcat -c

ECHO.
ECHO.[ INFO ] 开始执行Monkey命令
REM ECHO.[ INFO ] 强制关闭准备测试的APP
adb shell am force-stop %packageName%
 
:::::::::::::::::Monkey测试命令::::::::::::::::::::::::
::::::::::::修改策略请仅在此区域内修改:::::::::::::::::
ECHO.[ Exec ] adb shell monkey -p %packageName% -s %c_time%  --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 500 1200
 
adb shell monkey -p %packageName% -s %c_time% --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 100 1200>%logdir%\%logfilename%_monkey.log
 
::::::::::::修改策略请仅在此区域内修改:::::::::::::::::
::::::::::::::::::::::END::::::::::::::::::::::::::::::
ECHO.[ INFO ] 执行Monkey命令结束
ECHO.
 
ECHO.
ECHO.[ Exec ] 使用Logcat导出日志
adb logcat -d >%logdir%\%logfilename%_logcat.log
 
:EXIT
ECHO.
ECHO.[ INFO ] 请按任意键关闭窗口...
PAUSE
