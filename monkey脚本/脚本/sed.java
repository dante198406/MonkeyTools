#!/bin/bash
a1=`sed -n "/$2/{=;q;}" $1`
b2=`sed -n "/$3/{=;q;}" $1`
eval sed -n "${a1},${b2}p" $1










seq 9 |sed -n '/3/,/7/{/3/n;/7/b;p}'


awk '/3/{while(getline)if($0!~/7/)print;else exit}'


用grep-E就可以搞定，如下是虚拟机上的验证结果
[root@localhost Desktop]# echo "<a> sajfasjf" >123.txt
[root@localhost Desktop]# echo "<b> yedrgsd" >>123.txt
[root@localhost Desktop]# echo "<c> jfamfoias" >>123.txt
[root@localhost Desktop]# echo "<d> 1242353425" >>123.txt
[root@localhost Desktop]# cat 123.txt
<a> sajfasjf
<b> yedrgsd
<c> jfamfoias
<d> 1242353425
[root@localhost Desktop]# grep -E '<a>|<b>' 123.txt >>temp.txt
[root@localhost Desktop]# cat temp.txt
<a> sajfasjf
<b> yedrgsd
[root@localhost Desktop]#