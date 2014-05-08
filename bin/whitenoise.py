#!/usr/bin/python
# @file whitenoise.py
# Date Created: Thu 08 May 2014 13:59:02 BST by seblovett on seblovett-Ubuntu
# <+Last Edited: Thu 08 May 2014 18:31:39 BST by seblovett on seblovett-Ubuntu +>
# @author seblovett
# @brief A brief description of this code

## @brief Documentation for a function.
#  @param - None
#  @retval - None
#  More details.

import os
import random
from optparse import OptionParser
import sim
def WriteRandom(options):
	randops = list()
	#outfile = open(options.hexfile, "w")
	for i in range(options.length):
		randops.append("%0.4x\n" % random.randint(0,65335))
	#outfile.close()
	return randops

HexToOp = {
		0 : "LDW",
		1 : "POP",
		2 : "ADD",
		3 : "ADDIB",
		4 : "ADC",
		5 : "ADCI",
		6 : "ADDI",
		7 : "CMP",
		8 : "STW",
		9 : "PUSH",
		10 : "SUB",
		11 : "SUBIB",
		12 : "SUC",
		13 : "SUCI",
		14 : "SUBI",
		15 : "CMPI",
		16 : "AND",
		17 : "OR",
		18 : "NOT",
		19 : "XOR",
		20 : "LUI",
		21 : "LLI",
		22 : "NAND",
		23 : "NOR",
		24 : "X",
		25 : "INTERRUPT",
		26 : "NEG",
		27 : "X",
		28 : "ASR",
		29 : "LSR",
		30 : "BRANCH",
		31 : "LSL"
}

def GetOp(hexstr):
	i = int(hexstr, 16)
	op = i >> 11
	return HexToOp[op]
def CheckOps(ops, options):
	#need to check the following:
	#no BGE or BLT acts on the result of a logic operation
	#no unused opcodes are used
	for i in range(len(ops)):
		if (GetOp(ops[i]) == "X") or (GetOp(ops[i]) == "INTERRUPT") or (GetOp(ops[i]) == "BRANCH"):
			ops[i] = "0000\n"
	
	return ops

if "__main__" == __name__:
	''' Code to be run if this is main '''
	print("White Noise Test")
	random.seed()
	parser = OptionParser(usage="%p", version="0.1", description="starts a white noise test")

	
	(options, args) = parser.parse_args()
	progfile = os.path.expanduser("~/VLSI/Design/Implementation/programs/noise.hex")
	print progfile
	setattr(options, "hexfile", progfile)
	setattr(options, "length", 2048)
	print options
	ops = WriteRandom(options)
	#print ops
	ops = CheckOps(ops,options)
	#print ops
	write = "".join(ops)
	f = open(options.hexfile, "w")
	f.write(write)
	f.close()
	setattr(options, "program", "noise.hex")
	setattr(options, "module", None)
	setattr(options, "switches", "0")
	setattr(options, "debug", False)
	setattr(options, "home", None)
	setattr(options, "type", None)
	setattr(options, "scanpath", False)
	setattr(options, "gui", False)
	setattr(options, "legacy", True)
	sim.RunSim(options, "")
	pass

