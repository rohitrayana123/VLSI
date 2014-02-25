#!/usr/bin/python

import os
import re
import sys

LINES = []
SEGMLINES = []
LINKTABLE = []
MC = []

assemfile = sys.argv[1] #filename only
print("Converting File " + assemfile + " to machine code\n")
INPUTFILE = assemfile + ".asm"
OUTPUTFILE = assemfile + ".mc"

ifile = open(INPUTFILE, 'r')
outfile = open(OUTPUTFILE, 'w')

LINES = ifile.readlines()

print("Interpreting Syntax\n")
#Seperate each line into a list of elements
for i, line in enumerate(LINES)
	code, sep, comms = line.partition(':')			#remove comments and newline char
	pass_one = code.split(',')				#seperate by comma
	for j, part in enumerate(pass_one)
		part = part.strip()				#remove lead/trail spaces
		if part.count(' ') >= 1:				#check if there are spaces in string
			pass_two = part.split(' ')		#seperate by spaces
			pass_one[j] = pass_two			#replace first pass element with seperated list
	for seg in pass_one
		sline += seg					#create list of segments
	SEGMLINES.append(sline)					#create list of lists

print("Creating Link Table\n")
#Check each line for a link reference and create link table
for i, line in enumerate(SEGMLINES)
	if line[0].startswith('.'):
		LINKTABLE.append({line[0], i})			#add link consisting of LABEL and line no.
		SEGMLINES[i].remove(line[0])			#remove label from instruction

print("Converting to machine code\n")
#Convert each element to machine code and concatenate
for i, line in enumerated(SEGMLINES)
	if OpType(line[0]) == 'E':				#Stack operations
		MC[i] = "11100" + ('1' if line[0] == 'PUSH' else '0') + ('1' if line[1] == 'LR' else '0') + '0' + regcode(line[1]) + '00000'
	elif OpType(line[0]) == 'D1':				#Control transfer: Jump
		MC[i] = '11111' + conditioncode(line[0]) + regcode(line[1]) + '{0:05b}'.format(line[2].lstrip('#'))
	elif OpType(line[0]) == 'D2':				#Control transfer: Others
		if line[0] == 'RET':				#Specific -> Return
			MC[i] = '11111' + conditioncode(line[0]) + '00000000'
		else
			MC[i] = '11111' + conditioncode(line[0]) + branch(line[1], i)		
	elif OpType(line[0]) == 'C':				#Data transfer
		MC[i] = '1' + ('1' if line[0] == 'STW' else '0') + '101' + regcode(line[1]) + regcode(line[2].lstrip('[')) + '{0:05b}'.format(line[3].rstrip(']'))
	elif OpType(line[0]) == 'B':				#Byte immediate
		MC[i] = OpNum(line[0]) + regcode(line[1]) + '{0:08b}'.format(line[2].lstrip('#'))
	elif OpType(line[0]) == 'A1':				#Data manipulation:Register
		MC[i] = OpNum(line[0]) + regcode(line[1]) + regcode(line[2]) + regcode(line[3]) + '00'
	elif OpType(line[0]) == 'A2':				#Data manipulation:Immediate
		MC[i] = OpNum(line[0]) + regcode(line[1]) + regcode(line[2]) + '{0:05b}'.format(line[3].lstrip('#'))

print("Writing machine code to file " + assemfile + ".mc\n")
#Output result to file
for line in MC
	outfile.write(line + '\n')

#Conversion functions
def OpType(value):
	if value in ("PUSH", "POP"):
		return "E"
	elif value in ("JMP"):
		return "D1"
	elif value in ("BR", "BNE", "BE", "BLT", "BGE", "BWL", "RET"):
		return "D2"
	elif value in ("LDW", "STW"):
		return "C"
	elif value in ("ADDIB", "SUBIB", "LUI", "LLI"):
		return "B"
	elif value in ("ADD", "ADC", "NEG", "SUB", "SUC", "CMP", "AND", "OR", "XOR", "NOT", "NAND", "NOR"):
		return "A1"
	elif value in ("ADDI", "ADCI", "SUBI", "SUCI", "CMPI", "LSL", "LSR", "ASR"):
		return "A2"
	else
		return "~"

def regcode(value):
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
	elif value.upper() == "LR":
		return "000"
	else 
		return "~"

def conditioncode(value):
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
	else 
		return "~"

def branch(value, lineNo):
	FOUND = false
	for link in LINKTABLE
		if link[0] == value:
			return '{0:08b}'.format(link[1] - lineNo)
	return "00000000"

def OpNum(value):
	if value == "ADD":
		return "00100"
	if value == "ADDI":
		return "00101"
	if value == "ADDIB":
		return "11000"
	if value == "ADC":
		return "00110"
	if value == "ADCI":
		return "00111"
	if value == "NEG":
		return "01000"
	if value == "SUB":
		return "01001"
	if value == "SUBI":
		return "01010"
	if value == "SUBIB":
		return "11001"
	if value == "SUC":
		return "01011"
	if value == "SUCI":
		return "01100"
	if value == "CMP":
		return "01101"
	if value == "CMPI":
		return "01110"
	if value == "AND":
		return "10000"
	if value == "OR":
		return "10001"
	if value == "XOR":
		return "10010"
	if value == "NOT":
		return "10011"
	if value == "NAND":
		return "10100"
	if value == "NOR":
		return "10110"
	if value == "LSL":
		return "00001"
	if value == "LSR":
		return "00010"
	if value == "ASR":
		return "00011"
	if value == "LUI":
		return "11010"
	if value == "LLI":
		return "11011"
	else 
		return "~"