#!/usr/bin/python
# @file runsim.py
# Date Created: Mon 24 Feb 2014 18:08:33 GMT by seblovett on seblovett-Ubuntu
# <+Last Edited: Thu 27 Feb 2014 16:23:16 GMT by hl13g10 on hart2.ecs.soton.ac.uk +>
# @author seblovett
# @brief to invoke the simulator for various tasks
# @todo list:
# 	Add support for running magic simulations
#	Check that the files exist
#	Auto invoke the assembler when given a .asm file
# Known bugs and limitations
#	Magic simulations not supported
#	Won't auto detect file extensions
import os
from optparse import OptionParser
from subprocess import call



def RunSim(options):
	print "Running sim..."
	home = os.path.expanduser("~/VLSI")
	behave = os.path.join(home, "Design/Implementation/verilog/behavioural")
	stim = os.path.join(home, "Design/Implementation/verification")
	programs = os.path.join(home, "Design/Implementation/programs")
	magic = os.path.join(home, "Design/Implementation/magic/c035u/%s" % options.module)
	#@todo Check files exist

	#piece together the command
	#starting poitn
	cmd = ["ncverilog", "-sv"]
	#to gui or not to gui?
	if options.gui: #run with a gui
		cmd.append("+gui")
		cmd.append("+ncaccess+r")
		#tcl file?
		#are we doing a full system or module?
		if (None != options.module): #module simulation
			#see if tcl exists
			tclpath = os.path.join(stim, options.module+".tcl")
			if ( os.path.exists(tclpath)):
				cmd.append("+tcl+%s" % tclpath)
		else: #running system
			tclpath = os.path.join(stim, "system.tcl")
			cmd.append("+tcl+%s" % tclpath)
	else:
		cmd.append("-exit")
	#library
	cmd.append("+libext+.sv")
	cmd.append("-y")
	if options.magic:
		cmd.append(magic)
		cmd.append("+incdir+%s" % magic)
	else:
		cmd.append(behave)
		cmd.append("+incdir+%s" % behave)
	# opcodes comes before stim file
	cmd.append(behave+"/opcodes.svh")
	#top level stim file
	if (None != options.module): #use the stim file
		#cmd.append("-v")
		cmd.append(os.path.join(stim, options.module+"_stim.sv"))
	else: #running a system program
		#cmd.append("-v")
		cmd.append(os.path.join(stim, "prog_stim.sv"))
		programfile, fileExtension = os.path.splitext(options.program)
		if os.path.exists(os.path.join(programs, programfile+".asm")): #found us some assembler - compile it!
			print("Invoking compiler...")
			asmb = os.path.join(programs, programfile)
			print asmb
			call(["python", os.path.join(home, "bin/assemble.py"), asmb])

		cmd.append('+define+prog_file=\\\\\\\"%s\\\\\\\"' % os.path.join(programs, programfile+".hex"))

	# Hard code for bim
	cmd.append('+define+switch_value=2569')

	#opcodes.svh
	#cmd.append(behave+"/opcodes.svh") # will work here but not first time

	#print the command
	print " ".join(cmd)
	#run the command
	if options.magic: #need to run the extraction
		magicrc = open("magicext", 'w')
		magicrc.write(":extract\n:quit\n")
		magicrc.close()
		magicsim = open("magicsim", 'w')
		magicsim.write("magic -d null %s < magicext\n" % options.module)
		magicsim.close()
		cmdmag = ["bash", "magicsim" ]
		call(cmdmag)
		print(cmdmag)
	if options.debug == False:
		call(cmd)
	pass



if "__main__" == __name__:
	''' Run Sim V2.0 '''
	print "Run Sim V2.0"

	#some global things
	#parse the options
	#interactive mode?
	parser = OptionParser(usage="sim.py [-m module.sv / -p program.hex ] -g -M")
	#@todo - auto invoke the assembler if assembly is given?
	parser.add_option("-m", "--module", dest="module",
                  help="module to simulate - should not be defined if program is")

	parser.add_option("-M", "--magic", dest="magic", action="store_true", default=False,
                  help="runs the simulation using the magic layout.")

	parser.add_option("-p", "--prog", dest="program",
                  help="program to run (hex file) should not be defined if module is")

	parser.add_option("-g", "--gui",
                  action="store_true", dest="gui", default=False,
                  help="Run the simulation with a GUI")
	parser.add_option("-d", action="store_true", dest="debug", default=False, help="Make, but don't execute, the command")
	(options, args) = parser.parse_args()

	#want either a module or program to be able to run
	if (None == options.module ) and ( None == options.program ):
		parser.print_help()
	elif (None != options.module ) and ( None != options.program ):
		print("Cannot specify both program and module")
		parser.print_help()
	else:
		RunSim(options)





