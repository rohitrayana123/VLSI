#!/usr/bin/python
import os
from optparse import OptionParser
from subprocess import call

if "__main__" == __name__:
	''' asm2txt V1.0 '''
	print "asm2txt V1.0\n"
	print "Converting all files in directory to BIM's txt files...\n"
	# List all files
	files = [f for f in os.listdir('.') if os.path.isfile(f)]
	for f in files:
		if(f[-4:] == ".asm"):
			print f
			asmCall = ["python","assemble.py"]
			asmCall.append("%s" % f)
			print asmCall
			call(asmCall)
			fileHEX = open(f.replace(".asm",".hex"),'r+')
			fileTXT = open(f.replace(".asm",".txt"),'w+')
			lineNUM = 0
			for line in fileHEX:
				hex = ("%x" % lineNUM)
				while(len(hex) < 4):
					hex = '0' + hex
				fileTXT.write("@%s %s \n" % (hex,line.strip('\n')))
				lineNUM = lineNUM + 1

