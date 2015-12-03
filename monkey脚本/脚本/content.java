#!D:\program files (x86)\Python33\python.exe
#-*-code:cp936-*-
#Filename:content.py
#Python3 import re pat=re.compile('<content>(.+?)</content>')
file=open('1.txt')#old file
new_file=open('new_1.txt','w')#new file
for line in file:
match=pat.search(line)
if match:#find"<content>xxx</content>"
print(match.group(1),file=new_file)#write to the new file
file.close()#close old file
new_file.close()#close new file