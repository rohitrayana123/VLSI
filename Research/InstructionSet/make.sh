#!/bin/bash
file=InstructionSet

#clean
rm *.aux
rm *.bbl
rm *.log
rm *.blg
rm *.toc

#make
pdflatex ${file}.tex
bibtex ${file}
pdflatex ${file}.tex
pdflatex ${file}.tex
 
#clean
rm *.aux
rm *.bbl
rm *.log
rm *.blg
rm *.toc
