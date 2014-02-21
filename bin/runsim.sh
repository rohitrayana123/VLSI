#!/bin/bash
#cd ~/VLSI/bin
imp="${HOME}/VLSI/Design/Implementation"
behave="${imp}/verilog/behavioural"
stim="${imp}/verification"

# HELP function
function printHelp (){
   echo "-------- HELP --------"
   echo "Parameter 1: Module"
   ls | grep _stim.sv
   echo "N.B. run without '_stim.sv' after name"
   echo "Paramter 2: GUI"
   echo "   no_gui  "
   echo "   gui      (default)"
}


# GUI Option
cmd="ncverilog -sv"
gui="$2"
gui=${gui//[-.]/} # Remove tag
case $gui in

   "gui")      echo "GUI" ; cmd="$cmd +gui" ;; 
   *)             echo "NO GUI" ;; 
esac
cmd="$cmd +ncaccess+r"


# Which module to test
module="$1"
module=${module//[-.]/} # Remove tag

#HSL:
#there's an exception
if [ "system" == ${module} ]; then
	cmd="$cmd  +libext+.sv +incdir+${behave} -y ${behave} -v ${behave}/options.sv ${behave}/opcodes.svh ${behave}/system.sv +define+prog_file=\"${behave}/program.hex\" +tcl+${stim}/system.tcl"
	#cmd="ncverilog -sv +gui +ncaccess+r +libext+.sv -y . opcodes.svh system.sv"
elif [ -f ${stim}/${module}_stim.sv ]; then
	cmd="$cmd +libext+.sv -y ${behave} ${behave}/opcodes.svh ${stim}/${module}_stim.sv"
else
	echo "Unkown module $module"
	printHelp;
	exit 1;
fi

echo $cmd
$cmd  # Call SimVision

