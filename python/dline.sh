#!/bin/bash
# 功能:		删除文件中含"指定内容"的行
# 运行方式:	./dline.sh monkeysyslog.log	==> 产生输出文件: monkeysyslog.log.result
# by zhangzhaolei

array=(
	"Sleeping"
	":Sending"
	"Selecting"
	"Using"
	":Switch:"
	"Allowing"
	"activityResuming"
	"Sending"
	"calendar_time"
)

if [ $# -lt 1 ]; then
	echo "Usage: $0 <logfile>"
	exit
fi

file="$1".result
cp -f $1 $file

function deleteLine()
{
	sed "/$1/d" $file > tmp
	mv -f tmp $file
}

wc -l $file

for line in "${array[@]}"
do
	if [ ${#line} -gt 0 ] && [ ${line:0:1} != "#" ]; then
		deleteLine "$line"
	fi
done

wc -l $file
