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
# Folder layout
DES="../Design"
IMP="Implementation"
# Copy the verilog folder
VER="verilog"
echo "Copying across $VER folder..."
mkdir /$HOME/$USER/$DESIGN/$FCDE/$VER
cp -rf $DES/$IMP/$VER/*  /$HOME/$USER/$DESIGN/$FCDE/$VER
ls -l /$HOME/$USER/$DESIGN/$FCDE/$VER 
echo ""
#Copy the verify folder
VERIF="verification"
BER="behavioural"
echo "Copying across $VERIF folder..."
cp -rf $DES/$IMP/$VERIF/*  /$HOME/$USER/$DESIGN/$FCDE/$VER/$BER
ls -l /$HOME/$USER/$DESIGN/$FCDE/$VER 
echo ""
#Copy the program folder
PROG="programs"
echo "Copying across $PROG folder..."
mkdir /$HOME/$USER/$DESIGN/$FCDE/$VER/$PROG
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
