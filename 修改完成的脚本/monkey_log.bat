@ECHO OFF
ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                 Monkey Test                 ::
ECHO.::               by zhangzhaolei               ::
ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.[ INFO ] ׼��Monkey����
 
REM ��ȡ����,��ʽΪ��20150608
SET c_date=%date:~0,4%%date:~5,2%%date:~8,2%
REM ��ȡ��Сʱ,��ʽΪ��24Сʱ�ƣ�10��ǰ��0
SET c_time=%time:~0,2%
    IF /i %c_time% LSS 10 (
SET c_time=0%time:~1,1%
)
REM ���Сʱ���֡��룬��ʽΪ: 131420
SET c_time=%c_time%%time:~3,2%%time:~6,2%
REM ��������ʱ�����Ϊ��־�ļ���
SET logfilename=%c_date%%c_time%
 
 
REM ������������Ŀ¼������APP��־����Ŀ¼
IF NOT EXIST %~dp0\%c_date%    md %~dp0\%c_date%
SET logdir="%~dp0\%c_date%\"
IF NOT EXIST %logdir% (
    ECHO.[ Exec ] ����Ŀ¼��%c_date%
    md %logdir%
)
 
ECHO.
ECHO.[ Exec ] ���Phone��log
adb logcat -c

ECHO.
ECHO.[ INFO ] ��ʼִ��Monkey����
REM ǿ�ƹر�׼�����Ե�APP
REM adb shell am force-stop %packageName%
 
:::::::::::::::::Monkey��������::::::::::::::::::::::::
::::::::::::�޸Ĳ�������ڴ��������޸�:::::::::::::::::
ECHO.[ Exec ] adb shell monkey -p com.android.settings -s %c_time%  --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 100 100

adb shell monkey -p com.android.settings -s %c_time% --ignore-crashes --ignore-timeouts --ignore-security-exceptions --pct-trackball 0 --pct-nav 0 --pct-majornav 0 --pct-anyevent 0 -v -v -v --throttle 100 100>%logdir%\%logfilename%_monkey.log
 
::::::::::::�޸Ĳ�������ڴ��������޸�:::::::::::::::::
::::::::::::::::::::::END::::::::::::::::::::::::::::::
ECHO.[ INFO ] ִ��Monkey�������
ECHO.
 
ECHO.
ECHO.[ Exec ] ʹ��Logcat������־
adb logcat -d >%logdir%\%logfilename%_main.log
 
:EXIT
ECHO.
ECHO.[ INFO ] �밴������رմ���...
PAUSE>nul
