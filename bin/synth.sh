#!/bin/bash
# @file synth.sh
# Date Created: Wed 19 Feb 2014 23:18:49 GMT by seblovett on hind.ecs.soton.ac.uk
# <+Last Edited: Thu 20 Feb 2014 00:14:11 GMT by hl13g10 on hind.ecs.soton.ac.uk +>

echo sythesise script
rm rc*
module=$1
if [ -f behavioural/${module}.sv ]; then 
	echo Synthesising $module
else
	echo $module not found
	exit 1
fi
#Run the sythesis tool
rc_custom -batch -pkg behavioural/opcodes.svh behavioural/${module}.sv gate_level/${module}.sv
#check the log for errors
cat rc.log | grep Error
if [ $? == 0 ]; then #found an error
	echo "Synthesis Error"
	exit 1
fi

# @todo check if this exists, else make
if [ ! -d place_route ]; then
	mkdir place_route
fi
cd place_route/

vlog2net -T c035u -clocks  ../gate_level/${module}.sv ../../../magic/c035u/cell_lib

echo ":b h 10000" > magicroute.tcl
echo ":route" >> magicroute.tcl 
echo ":save" >> magicroute.tcl
echo ":quit" >> magicroute.tcl

magic ${module}_PLACED -d null < magicroute.tcl
rm magicroute.tcl
vlog2net -T c035u -post ../gate_level/${module}.sv ../../../magic/c035u/cell_lib
exit 0

