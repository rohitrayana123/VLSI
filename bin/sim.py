#!/usr/bin/python
# @file runsim.py
# Date Created: Mon 24 Feb 2014 18:08:33 GMT by seblovett on seblovett-Ubuntu
# <+Last Edited: Mon 24 Feb 2014 19:14:02 GMT by seblovett on seblovett-Ubuntu +>
# @author seblovett
# @brief A brief description of this code
import os
from optparse import OptionParser
from subprocess import call
if "__main__" == __name__:
	''' Run Sim V2.0 '''
	print "Run Sim V2.0"
	
	#some global things
	home = os.path.expanduser("~/VLSI")
	behave = os.path.join(home, "Design/Implementation/verilog/behavioural")
	stim = os.path.join(home, "Design/Implementation/verification")
	programs = os.path.join(home, "Design/Implementation/programs")
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
	(options, args) = parser.parse_args()
	
	#want either a module or program to be able to run
	if (None == options.module ) and ( None == options.program ):
		parser.print_help()
	elif (None != options.module ) and ( None != options.program ):
		print("Cannot specify both program and module")
		parser.print_help()
	else:
		print "Running sim..."
		#Check files exist
		#@todo
		#piece together the command
		cmd = ["ncverilog", "-sv"]
		if options.gui: #run with a gui
			cmd.append("+gui")
			cmd.append("+ncaccess+r")
			#tcl file?
			#are we doing a full system or module?
			if (None != options.module): #module simulation
				#see if tcl exists
				tclpath = os.path.join(stim, options.module+".tcl")
				print tclpath
				if ( os.path.exists(tclpath)):
					print("Tcl found")
					cmd.append("+tcl+%s" % tclpath)
			
		#library
		cmd.append("+libext+.sv")
		cmd.append("-y") 
		cmd.append(behave)
		#options and opcodes
		cmd.append("-v")
		cmd.append(behave+"/opcodes.svh") 
		cmd.append(behave+"/options.sv")
		
		if (None != options.module): #use the stim file
			cmd.append("+nctop+"+os.path.join(stim, options.module+"_stim.sv"))
		else: #running a system program
			cmd.append("+nctop+"+os.path.join(behave, "system.sv"))
			cmd.append('+define+prog_file="%s"' % os.path.join(programs, options.program+".hex"))
		#run the command
		print cmd
		call(cmd)
		

	print options

	
	pass

