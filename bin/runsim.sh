#! /bin/bash
cd ~/VLSI/bin
imp="../Design/Implementation"
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
   "no_gui")      echo "No GUI";;
   *)             echo "GUI" ; cmd="$cmd +gui" ;; 
esac
cmd="$cmd +ncaccess+r"


# Which module to test
module="$1"
module=${module//[-.]/} # Remove tag

#HSL:
if [ -f ${stim}/${module}_stim.sv ]; then
	cmd="$cmd +libext+.sv -y ${behave} ${behave}/opcodes.svh ${stim}/${module}_stim.sv"
else
	echo "Unkown module $module"
	printHelp;
	exit 1;
fi

echo $cmd
$cmd  # Call SimVision

