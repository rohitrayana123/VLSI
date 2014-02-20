#!/usr/bin/python

import os
import re
import sys

MNEUMONICS = [	"ADD", "ADDI", "ADDIB", "ADC", "ADCI",
		"NEG", "SUB", "SUBI", "SUBIB", "SUC", 
		"SUCI", "CMP", "AND", "OR", "XOR", 
		"NOT", "NAND", "NOR", "LSL", "LSR",
		"ASR", "LDW", "SDW", "LUI", "LLI", 
		"BR", "BNE", "BE", "BLT", "BGE",
		"BWL", "RET", "ABR", "PUSH", "POP" ]
REGISTERS = [	"R0", "R1", "R2", "R3", "R4", "R5",  "R6",  "R7",  "LR" ]
LINES = []
SEGMLINES = []
LINKTABLE = []
MC = []

assemfile = sys.argv[1] #filename only
print("Converting File " + assemfile + " to machine code")
INPUTFILE = assemfile + ".txt"
OUTPUTFILE = assemfile + "_mc.txt"

ifile = open(INPUTFILE, 'r')
outfile = open(OUTPUTFILE, 'w')

LINES = ifile.readlines()

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

#Check each line for a link reference and create link table
for i, line in enumerate(SEGMLINES)
	if line[0].startswith('.'):
		LINKTABLE.append({line[0], i})			#add link consisting of LABEL and line no.
		SEGMLINES[i].remove(line[0])			#remove label from instruction

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
			MC[i] = '11111' + conditioncode(line[0]) + branch(line[1])		
	elif OpType(line[0]) == 'C':				#Data transfer
		MC[i] = '1' + ('1' if line[0] == 'STW' else '0') + '101' + regcode(line[1]) + regcode(line[2].lstrip('[')) + '{0:05b}'.format(line[3].rstrip(']'))
	elif OpType(line[0]) == 'B':				#Byte immediate
		MC[i] = OpNum(line[0]) + regcode(line[1]) + '{0:08b}'.format(line[2].lstrip('#'))
	elif OpType(line[0]) == 'A1':				#Data manipulation:Register
		MC[i] = OpNum(line[0]) + regcode(line[1]) + regcode(line[2]) + regcode(line[3]) + '00'
	elif OpType(line[0]) == 'A2':				#Data manipulation:Immediate
		MC[i] = OpNum(line[0]) + regcode(line[1]) + regcode(line[2]) + '{0:05b}'.format(line[3].lstrip('#'))

#Output result to file

#Conversion functions
def OpType(value):
	
	return 

def regcode(value):
	
	return

def conditioncode(value):
	
	return

def branch(value):
	
	return

def OpNum(value):
	
	return
