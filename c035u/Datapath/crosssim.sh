#!/bin/bash
# @file crosssim.sh
# Date Created: Tue 11 Mar 2014 14:48:22 GMT by seblovett on hind.ecs.soton.ac.uk
# <+Last Edited: Tue 11 Mar 2014 15:08:14 GMT by hl13g10 on hind.ecs.soton.ac.uk +>

ncverilog +libext+.sv +gui +ncaccess+r +tcl+Datapath.tcl +incdir+behavioural -y behavioural behavioural/opcodes.svh behavioural/system.sv datapath.sv  +define+crosssim
