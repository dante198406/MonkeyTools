#!/usr/bin/python 
# -*- coding: GBK -*- 
#writer:xmnathan 
#py�ļ�ȥע�� 
import re 
import os 
import ConfigParser 
Python='CleanNote'
def ReadIni(path,section,option):#�ļ�·�����½ڣ��ؼ��� 
  #��ȡini
  cf=ConfigParser.ConfigParser() 
  cf.read(path) 
  value=cf.get(section,option)#�����getint()��ֱ�Ӷ�ȡ����������Ϊ���� 
  return value 
def IsPassLine(strLine): 
  #�Ƿ��ǿ��Ժ��Ե��� 
  #�ɺ����е�������ʽ�б� 
  RegularExpressions=["""/'.*#.*/'""","""/".*#.*/"""", 
            """/'/'/'.*#.*/'/'/'""","""/"/"/".*#.*/"/"/""""]
  for One in RegularExpressions: 
    zz=re.compile(One) 
    if re.search(zz,strLine)==None: 
      continue
    else: 
      return True#��ƥ�� ����� 
    return False
def ReadFile(FileName): 
  #��ȡ�������ļ� 
  fobj=open(FileName,'r') 
  AllLines=fobj.readlines() 
  fobj.close() 
  NewStr='' 
  LogStr='/n%20s/n'%(FileName.split('//')[-1])#�������־ 
  nline=0
  for eachiline in AllLines: 
    index=eachline.find('#')#��ȡ��ע�;䡮#'��λ������ 
    if index==-1 or nline<3 or IsPassLine(eachline): 
      if eachiline.strip()!='':#�ų����յ��� 
        NewStr=NewStr+eachiline 
    else: 
      if index!=0: 
        NewStr=NewStr+eachiline[:index]+'/n'#��ȡ�����ע�Ͳ��� 
        LogStr+="ChangeLine: %s/t%s"%(nline,eachline[index:]) 
    nline+=1
  return NewStr,LogStr 
def MakeCleanFile(SrcPath,DescPath,FileList): 
  fLog=open(DescPath+'//'+'CleanNoteLog.txt','w') 
  for File in FileList: 
    curStr,LogStr=ReadFile(SrcPath+'//'+File) 
    fNew=open(DescPath+'//'+File,'w') 
    fNew=write(curStr) 
    fNew.close() 
    fLog.write(LogStr) 
  fLog.close() 
def Main(): 
  #��ini��ȡԴ�ļ��м�Ŀ���ļ���·�� 
  IniPath=os.getcwd()+'//'+PtName+'.ini'
  SrcPath=ReadIni(IniPath,PyName,'SrcPath')#Դ�ļ��� 
  DescPath=ReadIni(IniPath,PyName,'DescPath')#Ŀ���ļ��� 
  #���Ŀ���ļ��в����ڣ�����֮ 
  if not os.path.exists(DescPath): 
    os.makedirs(DescPath) 
  FileList=[] 
  for files in os.walk(SrcPath): 
    for FileName in files[2]: 
      if FileName.split('.')[-1]=='py': 
        FileList.append(FileName) 
  MakeCleanFile(SrcPath,DescPath,FileList) 
if __name__=='__main__': 
  Main() 
  print '>>>End<<<'
  os.system('pause') 
