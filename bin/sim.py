#!/usr/bin/python
# @file runsim.py
# Date Created: Mon 24 Feb 2014 18:08:33 GMT by seblovett on seblovett-Ubuntu
# <+Last Edited: Mon 28 Apr 2014 10:43:18 BST by hl13g10 on hind.ecs.soton.ac.uk +>
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
	if options.legacy:
		home = os.path.expanduser("~/VLSI")
		verilog = os.path.join(home, "Design/Implementation/verilog")
		stim = os.path.join(home, "Design/Implementation/verification")
		programs = os.path.join(home, "Design/Implementation/programs")
		magic = os.path.join(home, "c035u/design")
		fcdecells = os.path.join(home,"c035u/cell_lib")
		assembler = os.path.join(home,"bin/assemble.py")
	else:
		home = os.path.expanduser("~/design/fcde")
		verilog = os.path.join(home, "verilog")
		stim = os.path.join(os.path.expanduser("~/VLSI"), "Design/Implementation/verification")
		programs = os.path.join(home, verilog, "programs")
		magic = os.path.join(home, "magic/design")
		assembler = os.path.join(verilog,"assembler/assemble.py")
		fcdecells = os.path.join(home,"magic/cell_lib")
	#@todo Check files exist

	#piece together the command
	#starting poitn
	if None == options.type:
		options.type = "behavioural" #default 
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
			tclpath = os.path.join(verilog, options.type, "system.tcl")
			cmd.append("+tcl+%s" % tclpath)
	else:
		cmd.append("-exit")
	#library
	cmd.append("+libext+.sv")

        if options.module:
                print "Running a module simulation"
                #want the verification stim file, opcodes and module.sv
                if options.type == "magic":
                        print "Running a magic sim"
                        #extract the module
			#get current dir
			cwd = os.getcwd()
			#move to magic dir
			os.chdir(magic)
			#extract
			extfile = open("extract.sh", "w")
			extfile.write("magic -d null %s << EOF\n:extract\n:quit\nEOF" % options.module)
			extfile.close()
			call(["sh", "extract.sh"])
			#ext2svmod
			call(["ext2svmod",options.module])
			#return to old dir
			os.chdir(cwd)
			cmd.append("-y")
                        cmd.append(os.path.join(magic))
                        cmd.append("+incdir+%s" % magic)
                else:   
			cmd.append("-y")
                        cmd.append(os.path.join(verilog, options.type))
                        cmd.append("+incdir+%s" % os.path.join(verilog, options.type))
		cmd.append(os.path.join(verilog,"behavioural","opcodes.svh"))
                #top level stim file
                cmd.append(os.path.join(stim, "%s_stim.sv" % options.module))

	else:
		print "Running a system simulation"
		#@todo if extracted or mixed, extract the magic design
		cmd.append("-y")
		cmd.append(os.path.join(verilog, options.type))
		cmd.append("+incdir+%s" % os.path.join(verilog, options.type))

		cmd.append("-y")
		system = os.path.join(verilog, "system")
		cmd.append(system)
		cmd.append("+incdir+%s" % system)
		# opcodes comes before stim file
		cmd.append(os.path.join(verilog,"behavioural","opcodes.svh"))
		#top level stim file
	
		#cmd.append("-v")
		cmd.append(os.path.join(system, "system.sv"))
		programfile, fileExtension = os.path.splitext(options.program)
		if os.path.exists(os.path.join(programs, programfile+".asm")): #found us some assembler - compile it!
			print("Invoking assembler...")
			asmb = os.path.join(programs, programfile)
			print asmb
			call(["python", os.path.join(verilog, "programs/assemble.py"), asmb])
	
		cmd.append('+define+prog_file=\\\"%s\\\"' % os.path.join(programs, programfile+".hex"))
		cmd.append('+define+data_file=\\\"%s\\\"' % os.path.join(programs,"serial_data.hex"))	# Only use if enabled by program
		# Hard code for bim
		cmd.append('+define+switch_value=2569')
	#print the command
	print " ".join(cmd)
	#run the command
	if options.debug == False:
		call(cmd)
	pass



if "__main__" == __name__:
	''' Run Sim V2.0 '''

	#some global things
	#parse the options
	#interactive mode?
	parser = OptionParser(usage="sim.py [-t type] [-m module.sv / -p program.hex ] -g ", version="3")
	#@todo - auto invoke the assembler if assembly is given?
	parser.add_option("-m", "--module", dest="module",
                  help="module to simulate - should not be defined if program is")

	parser.add_option("-t", "--type", dest="type", help="Type of simulation to run, e.g. behavioural (default), mixed, extracted, magic")
	#parser.add_option("-M", "--magic", dest="magic", action="store_true", default=False,
        #          help="runs the simulation using the magic layout.")

	#parser.add_option("-c", "--mixed", dest="mixed", action="store_true", default=False,
        #          help="runs the cross simulation.")

	parser.add_option("-p", "--prog", dest="program",
                  help="program to run (hex file) should not be defined if module is")

	#parser.add_option("-G","--gate",  dest="gate", action="store_true", default=False,
	#			help="Run a gate level sim.")
	parser.add_option("-g", "--gui",
                  action="store_true", dest="gui", default=False,
                  help="Run the simulation with a GUI")
	parser.add_option("-d", action="store_true", dest="debug", default=False, help="Make, but don't execute, the command")
	parser.add_option("-l", action="store_true", dest="legacy", default=True, help="Run in legacy mode")
	parser.add_option("-i", action="store_false", dest="legacy", help="Run in fcde structure")
	(options, args) = parser.parse_args()
	#want either a module or program to be able to run
	if (None == options.module ) and ( None == options.program ):
		parser.print_help()
	elif (None != options.module ) and ( None != options.program ):
		print("Cannot specify both program and module")
		parser.print_help()
	else:
		RunSim(options)





