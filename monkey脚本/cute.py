# -*- coding: cp936 -*-
import re
text=open(r'log.txt').read()
match=re.search(r"����Ӧ�� Index:0(.*?)����Ӧ��� Index:75',text,re.S)
log2=open(r'log2.txt','w')
log2.write(match.group(1))
log2.close()
