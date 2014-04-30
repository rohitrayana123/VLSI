#!/usr/bin/python
# @file runsim.py
# Date Created: Mon 24 Feb 2014 18:08:33 GMT by seblovett on seblovett-Ubuntu
# <+Last Edited: Wed 30 Apr 2014 16:07:22 BST by seblovett on seblovett-Ubuntu +>
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
from optparse import OptionParser, SUPPRESS_HELP
from subprocess import call



def RunSim(options, args = None):
	print "Running sim..."
	if options.legacy:
		if options.home:
			home = os.path.expanduser(options.home)
		else:
			home = os.path.expanduser("~/VLSI")
		verilog = os.path.join(home, "Design/Implementation/verilog")
		stim = os.path.join(home, "Design/Implementation/verification")
		programs = os.path.join(home, "Design/Implementation/programs")
		magic = os.path.join(home, "c035u/design")
		fcdecells = os.path.join(home,"c035u/cell_lib")
		assembler = os.path.join(home,"bin/assemble.py")
	else:
		if options.home:
			home = os.path.expanduser(options.home)
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
	if options.scanpath:
		cmd.append("stimulus.sv")
		cmd.append("opcodes.svh")
		cmd.append("cpu.sv")
        elif options.module:
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
			call(["ext2svmod","-f",options.module])
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
	if options.switches:
		cmd.append('+define+switch_value=%s' % options.switches)
	cmd.append("+define+%s" % options.type)
	cmd = cmd + args;
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
	parser = OptionParser(usage="sim.py [-t type] [-m module.sv / -p program.asm ] [ -s switchvalue ] [ -gdS ] [+define+extra_definitions]", version="3", description="trailing arguments are given to the simulator directly")
	#@todo - auto invoke the assembler if assembly is given?
	parser.add_option("-m", "--module", dest="module",
                  help="module to simulate - should not be defined if program is")

	parser.add_option("-t", "--type", dest="type", help="Type of simulation to run, e.g. behavioural (default), mixed, extracted, magic")
	#parser.add_option("-M", "--magic", dest="magic", action="store_true", default=False,
        #          help="runs the simulation using the magic layout.")

	#parser.add_option("-c", "--mixed", dest="mixed", action="store_true", default=False,
        #          help="runs the cross simulation.")

	parser.add_option("-p", "--prog", dest="program",
                  help="program to run should not be defined if module is. Hex or ASM can be passed. ASM files will be assembled before running the simulator. ")

	#parser.add_option("-G","--gate",  dest="gate", action="store_true", default=False,
	#			help="Run a gate level sim.")
	parser.add_option("-g", "--gui",
                  action="store_true", dest="gui", default=False,
                  help="Run the simulation with a GUI")
	parser.add_option("-H", "--home", dest="home", help="change the default path to the verilog folder")
	parser.add_option("-s", "--switches", dest="switches", help="Value of switches to pass to the simulation")
	parser.add_option("-d", action="store_true", dest="debug", default=False, help="Make, but don't execute, the command")
	parser.add_option("-S", "--scanpath", action="store_true", dest="scanpath", default=False, help="Run the scan path simulation")
	parser.add_option("-l", action="store_true", dest="legacy", default=False, help=SUPPRESS_HELP)#"Run in legacy mode")
	parser.add_option("-i", action="store_false", dest="legacy", help=SUPPRESS_HELP)#"Run in fcde structure")
	(options, args) = parser.parse_args()
	#want either a module or program to be able to run
	print options
	Run = False #assume we're not going to run
	if options.scanpath:
		if options.program:
			print("Given program is ignored")
		if options.module:
			print("Given module is ignored")
		Run = True
		options.type = "extracted"
	if options.module and (None == options.program):
		Run = True
	if options.program and (None == options.module):
		Run = True
	if options.program and (options.type == "magic"):
		options.type = "extracted"
	if Run:
		RunSim(options, args)
	else:
		parser.print_help()




