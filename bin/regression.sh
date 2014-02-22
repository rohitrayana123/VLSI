#!/bin/bash

echo "Regression test of every program on entrie system..."


# Folders
behave="${HOME}/VLSI/Design/Implementation/verilog/behavioural"
verif="${HOME}/VLSI/Design/Implementation/verification"
prog_folder="${HOME}/VLSI/Design/Implementation/programs"

# All RAM setups in
progs="${prog_folder}/*_in.hex"

# Sim time
sim_time="10000"


for prog in $progs 
do
   echo $prog
   ram_out=${prog/in.hex/out.hex}
   cmd="ncverilog -sv +ncaccess+r +libext+.sv +incdir+${behave} -y ${behave} -v  ${behave}/opcodes.svh ${verif}/prog_stim.sv +define+prog_file=\"${prog}\" +define+sim_time=${sim_time} +define+ram_out=\"${ram_out}\" -exit"
   echo $cmd
   $cmd  
done


