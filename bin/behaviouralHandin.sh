#!/bin/bash

# Sort out folder to copy to
HOME="home"
DESIGN="design"
FCDE="fcde"
while true; do
   read -p "Remove everything in /$HOME/$USER/$DESIGN/$FCDE ?  "  yn
   case $yn in
      [Yy]* ) rm -rf /$HOME/$USER/$DESIGN/$FCDE; break;;
      [Nn]* ) echo "Exiting"; exit;;
      * ) echo "Please answer yes or no.";;
   esac
done
mkdir /$HOME/$USER/$DESIGN/$FCDE
DES="../Design"
IMP="Implementation"
VER="verilog"
VERIF="verification"
BER="behavioural"
PROG="programs"
BIN="bin"
SYS="system"
# Build hex file
echo "Building asm submission..."
cd $DES/$IMP/$PROG
python assemble.py multiply
cd ../../../$BIN
# Copy the verilog folder
echo "Copying across System folder..."
mkdir -p /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS
cp $DES/$IMP/$VER/$BER/cpu.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.
cp $DES/$IMP/$VER/$BER/decoder.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.
cp $DES/$IMP/$VER/$BER/demux_bus.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.
cp $DES/$IMP/$VER/$BER/io_leds.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.
cp $DES/$IMP/$VER/$BER/io_serial.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.
cp $DES/$IMP/$VER/$BER/io_switches.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.
cp $DES/$IMP/$VER/$BER/io_timer.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.
cp $DES/$IMP/$VER/$BER/ram.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.
cp $DES/$IMP/$VER/$BER/system.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS/.

ls -l /$HOME/$USER/$DESIGN/$FCDE/$VER/$SYS
echo ""
#Copy the verify folder
echo "Copying across behavioural folder..."
mkdir -p /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER
cp $DES/$IMP/$VER/$BER/alu.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
cp $DES/$IMP/$VER/$BER/control.sv  /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
cp $DES/$IMP/$VER/$BER/cpu_core.sv  /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
cp $DES/$IMP/$VER/$BER/datapath.sv  /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
cp $DES/$IMP/$VER/$BER/opcodes.svh  /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
cp $DES/$IMP/$VER/$BER/options.sv  /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
cp $DES/$IMP/$VER/$BER/regBlock.sv  /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
cp $DES/$IMP/$VER/$BER/signExtend.sv /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/. 
cp $DES/$IMP/$VER/$BER/trisreg.sv  /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
cp $DES/$IMP/$VERIF/system.tcl /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER/.
ls -l /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER
echo ""
#Copy the program folder
echo "Copying across $PROG folder..."
mkdir -p /$HOME/$USER/$DESIGN/$FCDE/$VER/$PROG
cp -rf $DES/$IMP/$PROG/*  /$HOME/$USER/$DESIGN/$FCDE/$VER/$PROG
ls -l /$HOME/$USER/$DESIGN/$FCDE/$VER
echo ""



#################################
# TODO: Make sure this copies everything needed for BIM handin script
################################







# Call the handin script
HANDIN="prepare_fcde behavioural"
cd /$HOME/$USER/$DESIGN/$FCDE
$HANDIN
