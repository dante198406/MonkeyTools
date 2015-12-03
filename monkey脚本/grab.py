# -*- coding: cp936 -*-
#原文地址：python从字符串内取两个符号之间的内容作者：phoenix
#版本: 3.1

def txt_wrap_by(start_str, end, html):
    start = html.find(start_str)
    if start >= 0:
        start += len(start_str)
        end = html.find(end, start)
        if end >= 0:
            return html[start:end].strip()
            
if __name__=="__main__":
    print(txt_wrap_by("《","》","《中国》"))
