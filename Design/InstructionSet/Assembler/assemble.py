#!/usr/bin/python
#Simple assembly program, takes assembly input file and outputs flat binary line with one line per instruction
#Input syntax rules:	':' or ';' for commenting
#			'.' must start label names
#			Parts of instruction must be seperated by one space
#			Ordering: [LABEL] - INSTRUCTION - OPERANDS - [COMMENTS]
#Currently supports: 	Only R0-R7, LR & recognises SP == R7
#			8 condition codes
#			Output to same directory as input file
#			Symbolic and numeric branching
#			Checking of immediate value sizes
#			NO input args checking
#			Instruction-less lines allowed (empty line or comments)
#Version: 1 (CMPI addition onwards)
#	  2 (Changed to final ISA, added special case I's and error checking
#         3 (Ajr changes - Hex output added, bug fix)
#	  4 (Added SP symbol)


import os
import re
import sys
import binascii
import string

LINES = []
SEGMLINES = []
LINKTABLE = []
MC = []

def ConvertToBin(x, length):
	if type(x) == str:
		val = int(x)
	else:
		val = x
	mask = 1 << length - 1
	binary = ""
	while mask > 0:
		if mask & val:
			binary+="1"
		else:
			binary+="0"
		mask >>= 1
	return binary

#Conversion functions
def OpType(value):	#Determine instruction format type
	if value in ("ENAI", "DISI", "RETI"):
		return "F"
	elif value in ("PUSH", "POP"):
		return "E"
	elif value in ("JMP"):
		return "D1"
	elif value in ("BR", "BNE", "BE", "BLT", "BGE", "BWL", "RET"):
		return "D2"
	elif value in ("LDW", "STW"):
		return "C"
	elif value in ("ADDIB", "SUBIB", "LUI", "LLI"):
		return "B"
	elif value in ("ADD", "ADC", "NEG", "SUB", "SUC", "CMP", "AND", "OR", "XOR", "NOT", "NAND", "NOR", "NOP"):
		return "A1"
	elif value in ("ADDI", "ADCI", "SUBI", "SUCI", "CMPI", "LSL", "LSR", "ASR"):
		return "A2"
	else:
		print 'ERROR1: Unrecognised Mneumonic'
		sys.exit()

def regcode(value):	#Get binary equivalent of register name
	if value.upper() == "R0":
		return "000"
	elif value.upper() == "R1":
		return "001"
	elif value.upper() == "R2":
		return "010"
	elif value.upper() == "R3":
		return "011"
	elif value.upper() == "R4":
		return "100"
	elif value.upper() == "R5":
		return "101"
	elif value.upper() == "R6":
		return "110"
	elif value.upper() == "R7":
		return "111"
	elif value.upper() == "SP":
		return "111"
	elif value.upper() == "LR":
		return "000"
	else:
		print 'ERROR2: Unrecognized Register Code'
		sys.exit()

def conditioncode(value):	#Get binary code for branching conditions
	if value == "BR":
		return "000"
	if value == "BNE":
		return "110"
	if value == "BE":
		return "111"
	if value == "BLT":
		return "100"
	if value == "BGE":
		return "101"
	if value == "BWL":
		return "011"
	if value == "RET":
		return "010"
	if value == "JMP":
		return "001"
	else:
		print 'ERROR3: Unrecognized Branch Condition'
		sys.exit()

def branch(value, lineNo, b=1):	#Calculate relative branch address for PC
	try:
		if b:
			return ConvertToBin(int(value), 8)
		else:
			return int(value)
	except:
		for link in LINKTABLE:
			if link[0] == value:
				if b:
					return ConvertToBin(link[1] - lineNo, 8)
				else:
					return link[1] - lineNo
		print 'ERROR4: Unknown Link Label'
		sys.exit()

def OpNum(value):	#Determine specific binary value for instruction
	if value == "F":
		return "11001"
	if value == "C":
		return "00000"
	elif value == "D1":
		return "11110"
	elif value == "D2":
		return "11110"
	elif value == "E":
		return "00001"
	elif value == "ADD":
		return "00010"
	elif value == "ADDI":
		return "00110"
	elif value == "ADDIB":
		return "00011"
	elif value == "ADC":
		return "00100"
	elif value == "ADCI":
		return "00101"
	elif value == "NEG":
		return "11010"
	elif value == "SUB":
		return "01010"
	elif value == "SUBI":
		return "01110"
	elif value == "SUBIB":
		return "01011"
	elif value == "SUC":
		return "01100"
	elif value == "SUCI":
		return "01101"
	elif value == "CMP":
		return "00111"
	elif value == "CMPI":
		return "01111"
	elif value == "AND":
		return "10000"
	elif value == "OR":
		return "10001"
	elif value == "XOR":
		return "10011"
	elif value == "NOT":
		return "10010"
	elif value == "NAND":
		return "10110"
	elif value == "NOR":
		return "10111"
	elif value == "LSL":
		return "11111"
	elif value == "LSR":
		return "11101"
	elif value == "ASR":
		return "11100"
	elif value == "LUI":
		return "10100"
	elif value == "LLI":
		return "10101"
	else:
		print 'ERROR5: Unrecognised Mneumonic'
		sys.exit()

if sys.argv[1] == "":
	print "Please provide input file name, type 'help' or '-h' for information and version history"
	sys.exit()
elif sys.argv[1] in ("help", "-h"):
	print "---Team R4 Assembler Help---"
	print "------Version: 1 (CMPI addition onwards)"
	print "               2 (Changed to final ISA, added special case I's and error checking"
        print "               3 (Ajr changes - Hex output added, bug fix)"
	print "               4 (Added SP symbol)"
	print "               5 (NOP support added, help added) UNTESTED"
	print "               6 (Interrupt support added [ENAI, DISI, RETI]. New sub-encoding type F |11001|Cond[3]|Ra[3]|xxxxx|.) UNTESTED"
	print "      Current is most recent iteration"
	print "Input Syntax: ./assemble filename"
	print "Commenting uses : or ;"
	print "Labels start with ."
	print "Instruction Syntax: .[LABELNAME] MNEUMONIC, OPERANDS, ..., :[COMMENTS]"
	print "Registers: R0, R1, R2, R3, R4, R5, R6, R7==SP"
	print "Branching: Symbolic and Numeric supported"
	print ""
	print "Notes: Input and output file directory are the same"
	print "       Input files assume .asm, no extension needed"
	print "       Immediate value sizes are checked"
	print "       Instruction-less lines allowed"
	sys.exit()

#Determine input/output file paths
assemfile = sys.argv[1]		#filename only
print '--------Converting File %s.py to machine code--------\n' % assemfile
INPUTFILE = assemfile + ".asm"
OUTPUTFILE = assemfile + ".mc"
HEXFILE = assemfile + ".hex"

ifile = open(INPUTFILE, 'r')
outfile = open(OUTPUTFILE, 'w')
hexfile = open(HEXFILE,'w')

LINES = ifile.readlines()	#Read input file contents

#Seperate each line into a list of elements
print '--------Interpreting Syntax-----------'
for line in LINES:
	#print '1. ' + line.strip('\n').strip('\t')
	try:
		code = line.split(':')[0]			#remove comments and newline char
		code = code.split(';')[0]
	except:
		code = line	#no comments on line
	if code.strip('\t').strip('\n') == '':			#skip blank lines
		continue
	#print code
	#print '2. ' + code.strip('\t')
	code = code.replace('\n',',')
	code = code.replace('\t',',')				#Remove tabs
	code = code.replace(' ',',')
	pass_zero = code.split(',')				#seperate by comma
	pass_one = []
	for seg in pass_zero:
		if(seg != ''):
			pass_one.append(seg)
	#print pass_one
	pass_two = []
	for j, part in enumerate(pass_one):
		pass_one[j] = pass_one[j].strip()		#remove lead/trail spaces
		pass_one[j] = pass_one[j].strip('[').strip(']').strip('#')
		if pass_one[j].count(' ') >= 1:			#check if there are spaces in string
			pass_two.extend(pass_one[j].split(' '))	#seperate by spaces
		else:
			pass_two.append(pass_one[j])
	#print pass_two
	SEGMLINES.append(pass_two)				#create list of lists
	#print pass_two
print 'Done\n'

#Check each line for a link reference and create link table
print '--------Creating Link Table----------\n'
for i, line in enumerate(SEGMLINES):
	if line[0].startswith('.'):
		LINKTABLE.append([line[0], i])			#add link consisting of LABEL and line no.
		SEGMLINES[i].remove(line[0])			#remove label from instruction
		#SEGMLINES[i].remove(line[0])			#remove empty element from seperation bug
print '    Link Table'
for l in LINKTABLE:
	print l
print '    Segmented instruction list:'
for s in SEGMLINES:
	print s

#Check for over-sized immediate values
for i, line in enumerate(SEGMLINES):
	if line[0] in ('LSL', 'LSR', 'ASR'):
		if int(line[3]) > 16:
			print 'ERROR6: Shifting By More Than 16'
			sys.exit()
	elif line[0] in ('ADDI', 'ADCI', 'SUBI', 'SUCI', 'LDW', 'STW'):
		if int(line[3]) > 32:
			print 'ERROR7: Imm5 Out Of Bounds'
			sys.exit()
	elif line[0] in ('CMPI', 'JMP'):
		if int(line[2]) > 32:
			print 'ERROR8: Imm5 Out Of Bounds'
			sys.exit()
	elif line[0] in ('ADDIB', 'SUBIB', 'LUI', 'LLI'):
		if int(line[2]) > 256:
			print 'ERROR9: Imm8 Out Of Bounds'
			sys.exit()

#Convert each element to machine code and concatenate
print '--------Converting to machine code-----------\n'
print 'Converting::',
for i, line in enumerate(SEGMLINES):
	print line[0],
	if OpType(line[0]) == 'F':				#Interrupt operations
		if line[0] == 'ENAI':
			MC.append(OpNum('F') + '001' + '00000000')
		elif line[0] == 'DISI':
			MC.append(OpNum('F') + '010' + '00000000')
		elif line[0] == 'RETI':
			MC.append(OpNum('F') + '000' + '11100000')#Always reads location pointed to by SP
	elif OpType(line[0]) == 'E':				#Stack operations
		temp = '0'
		if line[0] == 'PUSH':
			temp += '1'
		else:
			temp += '0'
		temp += '001'
		if line[1] == 'LR':
			temp += '1'
		else:
			temp += '0'
		temp += '00' + regcode(line[1]) + '00000'
		MC.append(temp)
	elif OpType(line[0]) == 'D1':				#Control transfer: Jump
		MC.append(OpNum('D1') + conditioncode(line[0]) + regcode(line[1]) + ConvertToBin(line[2], 5))
	elif OpType(line[0]) == 'D2':				#Control transfer: Others
		if line[0] == 'RET':				#Specific -> Return
			MC.append(OpNum('D2') + conditioncode(line[0]) + '00000000')
		else:
			MC.append(OpNum('D2') + conditioncode(line[0]) + branch(line[1], i))
			tempi = branch(line[1], i, 0)
			if  tempi > 127 or tempi < -128:
				print 'ERROR10: Imm8 Branch Out Of Bounds'
				sys.exit()
	elif OpType(line[0]) == 'C':				#Data transfer
		temp = '0'
		if line[0] == 'STW':
			temp += '1'
		else:
			temp += '0'
		temp += '000'
		temp += regcode(line[1]) + regcode(line[2]) + ConvertToBin(line[3], 5)
		MC.append(temp)
	elif OpType(line[0]) == 'B':				#Byte immediate
		temp = OpNum(line[0])
		temp += regcode(line[1])
		temp += ConvertToBin(line[2], 8)
		MC.append(temp)
	elif OpType(line[0]) == 'A1':				#Data manipulation:Register
		if (line[0] == 'NEG'):
			MC.append(OpNum(line[0]) + regcode(line[1]) + '000' + '000' + '00')
		elif (line[0] == 'CMP'):
			MC.append(OpNum(line[0]) + '000' + regcode(line[1]) + regcode(line[2]) + '00')
		elif (line[0] == 'NOT'):
			MC.append(OpNum(line[0]) + regcode(line[1]) + regcode(line[2]) + '000' + '00')
		elif (line[0] == 'NOP'):
			MC.append(OpNum(line[0]) + '00000000000')
		else:
			MC.append(OpNum(line[0]) + regcode(line[1]) + regcode(line[2]) + regcode(line[3]) + '00')
	elif OpType(line[0]) == 'A2':				#Data manipulation:Immediate
		if (line[0] == 'CMPI'):	#CMPI
			MC.append(OpNum(line[0]) + '000' + regcode(line[1]) + ConvertToBin(line[2], 5))
		else:
			MC.append(OpNum(line[0]) + regcode(line[1]) + regcode(line[2]) + ConvertToBin(line[3], 5))
	print ',',
#print ''
#print '    Binary Output:'
#for l in MC:
#	print l

# AJR - Do we need binary?
##Output result to file
#print 'Writing machine code to file %s.mc...\n' % assemfile
#for line in MC:
#	outfile.write(line + '\n')
#

#Output to hex file too
print ''
print '    Hex Output:'
for line in MC:
	hexline = ''.join([ "%x"%string.atoi(bin,2) for bin in line.split() ])
	while(len(hexline) < 4):
		hexline = '0'+ hexline
	print hexline
	hexfile.write(hexline + '\n')

print '--------Assembly Complete!--------\n'
