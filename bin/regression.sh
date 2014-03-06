#!/bin/bash

echo "Regression test of every program on entrie system..."

# Folders
prog_folder="${HOME}/VLSI/Design/Implementation/programs"

# All programs
progs="${prog_folder}/*.asm"

for prog in $progs 
do
	prog=${prog##*/}
	prog=${prog%????}
	python sim.py -p $prog
done


