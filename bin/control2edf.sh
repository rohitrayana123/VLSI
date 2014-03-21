#!/bin/bash
# @file control2edf.sh
# Date Created: Fri 21 Mar 2014 13:04:12 GMT by seblovett on hind.ecs.soton.ac.uk
# <+Last Edited: Fri 21 Mar 2014 13:07:12 GMT by hl13g10 on hind.ecs.soton.ac.uk +>


rm ~/design/tanner/control/control.sv
rc_custom -batch -pkg ~/VLSI/Design/Implementation/verilog/behavioural/opcodes.svh ~/VLSI/Design/Implementation/verilog/behavioural/control.sv ~/design/tanner/control/control.sv

if [ $? == 1 ]; then
	echo Synth failed
else
	vlog2edf -fcde ~/design/tanner/control/control.sv ~/design/tanner/control/control.edf

fi
