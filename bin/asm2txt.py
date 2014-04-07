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
			isr = 0
			fileASM = open(f,'r+')
			for line in fileASM:
				if(';' in line):
					cmd = line.split(';')[0]
				else:
					cmd = line
				print cmd
				if('.isr' in cmd):
					print ("ISR FOUND! %s" % line[0])
					break
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
				if(lineNUM > 15):
					asm = ' '
				elif((lineNUM > 1) and (lineNUM < 16)):
					asm = ("BR .main")
				elif (lineNUM == 0):
					asm = 'LUI R7,#7'
				elif (lineNUM == 1):
					asm = 'LLI R7,#255'
				fileTXT.write("@%s %s 	// %s \n" % (hex,line.strip('\n'),asm))
				lineNUM = lineNUM + 1

