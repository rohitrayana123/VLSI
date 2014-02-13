#!/bin/bash
file=TestBranch

#clean
rm *.aux
rm *.bbl
rm *.log
rm *.blg
rm *.toc

#make
pdflatex ${file}.tex
if [ $? != 0 ]; then
	echo Error Occured. Exiting
	exit 1
fi
bibtex bu1.aux
if [ $? != 0 ]; then
	echo Error Occured. Exiting
	exit 1
fi

bibtex bu2.aux
if [ $? != 0 ]; then
	echo Error Occured. Exiting
	exit 1
fi
pdflatex ${file}.tex
if [ $? != 0 ]; then
	echo Error Occured. Exiting
	exit 1
fi
pdflatex ${file}.tex
if [ $? != 0 ]; then
	echo Error Occured. Exiting
	exit 1
fi
 
#clean
rm *.aux
rm *.bbl
rm *.log
rm *.blg
rm *.toc
