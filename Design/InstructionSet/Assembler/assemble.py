#!/usr/bin/python
#Known bugs and limitations
# Currently doesn't support the use of labels
import os
import re
import sys
from optparse import OptionParser

MNEUMONICS = [	"ADD", "ADDI", "ADDIB", "ADC", "ADCI",
		"NEG", "SUB", "SUBI", "SUBIB", "SUC", 
		"SUCI", "CMP", "AND", "OR", "XOR", 
		"NOT", "NAND", "NOR", "LSL", "LSR",
		"ASR", "LDW", "SDW", "LUI", "LLI", 
		"BR", "BNE", "BE", "BLT", "BGE",
		"BWL", "RET", "ABR", "PUSH", "POP" ]
REGISTERS = [	"R0", "R1", "R2", "R3", "R4", "R5",  "R6",  "R7",  "LR" ]


Encodings = { 	"ADD"	: ("00100", "A"),
		"ADDI"	: ("00101", "A"),
		"ADDIB"	: ("11000", "B"),
		"ADC"	: ("00110", "A"),
		"ADCI"	: ("00111", "A"),
		"NEG"	: ("01000", "A"),
		"SUB"	: ("01001", "A"),
		"SUBI"	: ("01010", "A"),
		"SUBIB"	: ("11001", "B"),
		"SUC"	: ("01011", "A"),
		"SUCI"	: ("01100", "A"),
		"CMP"	: ("01101", "A"),
		"AND"	: ("10000", "A"),
		"OR"	: ("10001", "A"),
		"XOR"	: ("10010", "A"),
		"NOT"	: ("10011", "A"),
		"NAND"	: ("10100", "A"),
		"NOR"	: ("10110", "A"),
		"LSL"	: ("00001", "A"),
		"LSR"	: ("00010", "A"),
		"ASR"	: ("00011", "A"),
		"LDW"	: ("10101", "C"),
		"STW"	: ("11101", "C"),
		"LUI"	: ("11010", "B"),
		"LLI"	: ("11011", "B"),
		"BR"	: ("11111000", "D"),
		"BNE"	: ("11111110", "D"),
		"BE"	: ("11111111", "D"),
		"BLT"	: ("11111100", "D"),
		"BGE"	: ("11111101", "D"),
		"BWL"	: ("11111011", "D"),
		"RET"	: ("11111010", "D"),
		"JMP"	: ("11111001", "D"),
		"PUSH"	: ("111001", "E"),
		"POP"	: ("111000", "E")

	}

def ConvertToBin(number, length):
	print("WARNING NEXT LINE WON'T WORK ON HIND'S PYTHON VERSION. NEED TO FIND AN ALTERNATIVE")
	fmtstr = '{0:0' + str(length) + 'b}'
        return fmtstr.format(number)

def EncodeLine(asm):
	'''function to encode a single line'''
	print asm
	binary = ""
	#get mnemonic
	#strip any comments (after ;)
	for i, c in enumerate(asm):
		if c == ';':
			asm = asm[:i]
			break
	print asm
	#split by comma or space
	asm = re.split(' |,', asm)
	print asm
	#remove blank parts
	asm_parts = list()
	for a in asm:
		if a != "":
			asm_parts.append(a)
	print asm_parts
	asm = asm_parts #mnemonic now at asm[0]
	op = asm[0]
	#look up the format
	if asm[0] in Encodings:
		#key is in the list
		binary += Encodings[op][0] #get the opcode
	else: #error
		raise Exception("Opcode not recognised")

	#encode on type
	if "A" == Encodings[op][1]: #get the encoding type
		#Of the form Opcode, Rd, Ra, Rb/#
		#destination reg
		for a in asm[1:3]:
			if "R" != a[0]:
				raise Exception("Cannot use a non register for destination")
			a = int(a[1:]) #remove the prefix and convert to int
			if a > 7:
				raise Exception("Register out of range")
			binary += ConvertToBin(a, 3)
		if 3 < len(asm):
			a = asm[3] #last, could be a imm or reg
			if "R" == a[0]:
				a = int(a[1:])
				binary += ConvertToBin(a, 3)
				binary += "00" #trailing
			else:
				if a[0] == "#":
					a = a[1:]
				a = int(a)
				binary += ConvertToBin(a, 5)
		else:#caters for NEG and CMP
			if 2 == len(asm): #NEG
				binary += "00000000" # pad
			elif 3 == len(asm): #CMP
				binary += "00000" #pad
	
	if "B" == Encodings[op][1]: #B type encoding
		a = asm[1] #dest reg
		if "R" != a[0]:
			raise Exception("Cannot use a non register for destination")
		a = int(a[1:])
		binary += ConvertToBin(a, 3)
		a = asm[2]
		if a[0] == "#":
			a = a[1:]
		a = int(a)
		binary += ConvertToBin(a, 8)
	
	if "C" == Encodings[op][1]:
		#type C - mem access
		for a in asm[1:3]:
			if "R" != a[0]:
				raise Exception("Cannot use a non register for destination")
			a = int(a[1:]) #remove the prefix and convert to int
			if a > 7:
				raise Exception("Register out of range")
			binary += ConvertToBin(a, 3)
		a = asm[3] #last, is an imm 
		if a[0] == "#":
			a = a[1:]
		a = int(a)
		binary += ConvertToBin(a, 5)
		pass
	if "D" == Encodings[op][1]:
		#conditional branches
		if op == "RET":
			binary += "00000000"
		elif op == "JMP":
			#relative jump
			a = asm[1] #register
			if "R" != a[0]:
				raise Exception("Cannot use a non register for destination")
			a = int(a[1:]) #remove the prefix and convert to int
			if a > 7:
				raise Exception("Register out of range")
			binary += ConvertToBin(a, 3)
			a = asm[2] #last, is an imm 
			if a[0] == "#":
				a = a[1:]
			a = int(a)
			binary += ConvertToBin(a, 5)
		else:
			a = asm[1] #last, is an imm 
			if a[0] == "#":
				a = a[1:]
			a = int(a)
			binary += ConvertToBin(a, 8)
			
			
		pass 
	
	if "E" == Encodings[op][1]:
		#push / pop
		#of the form PUSH LR
		#or POP Rn
		if asm[1] == "LR":
			binary += "10000"
		else:
			if a[0] != "R":
				raise Exception("Register not valid")
			a = a[1:]
			a = int(a)
			if a > 7: 
				raise Exception("Register out of range")
			binary += "00"
			binary += ConvertToBin(a, 3)
		binary += "00000"
		
		pass 
	
	print binary
	if len(binary) != 16:
		raise Exception("hex code not correct length. Internal error")
	a = int(binary, 2)
	#convert to hex
	hexout = "%04x" % a
	#return hex
	print hexout
	return hexout
if "__main__" == __name__: #only runs is this is main	

	parser = OptionParser()
	parser.add_option("-a", "--asm", dest="asm",
                  help="assembler file input", metavar="FILE")	
	parser.add_option("-o", "--hex", dest="hexfile",
                  help="hex file output", metavar="FILE")	
	
	(options, args) = parser.parse_args()
	if None == options.asm:
		print("No assembler file given")
		parser.print_help()
		exit(1)
	print options
	assemfile = options.asm
	assemfile, fileExtension = os.path.splitext(assemfile)
	if None == options.hexfile:
		options.hexfile = assemfile+".hex"
	assemfile=assemfile+".asm"
	#check file exits
	if not os.path.exists(assemfile):
		print("Assembler file not found")
		print assemfile
		exit(1)

	print("Converting File " + assemfile + " to machine code")
	INPUTFILE = assemfile 
	OUTPUTFILE = options.hexfile
	
	ifile = open(INPUTFILE, 'r')
	outfile = open(OUTPUTFILE, 'w')
	
	LINES = ifile.readlines()
	for l in LINES:
		outfile.write(EncodeLine(l))
		outfile.write("\n")
	ifile.close()
	outfile.close()
