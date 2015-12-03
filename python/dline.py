#!/bin/env python
# function:	delete "selections" lines in file
# run:      python dline.py monkeysyslog.log
# by zhangzhaolei

import shutil, sys, os

darray = [
	"Sleeping for",
	":Sending Touch",
	":Sending Key",
	":Sending Flip",
	"// Selecting main",
	"//   + Using main",
	":Switch: #Intent",
	"    // Allowing start of",
	"    // activityResuming",
	"    // Sending event",
	"    //[calendar_time"
]

def isInArray (array, line):
	for item in array:
		if item in line:
			return True
	return False


if __name__ == '__main__':
	argv = sys.argv
	argc = len(argv)
	if argc < 2:
		print "Usage: %s <file>" %(os.path.basename(argv[0]))
		exit()
	fname = argv[1]
	fresult = fname + ".result"
	
	with open(fname, 'r') as f:
		with open(fresult, 'w') as g:
			for line in f.readlines():
				if not isInArray(darray, line):
					g.write(line)

