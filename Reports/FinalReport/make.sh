#!/bin/bash
# @file make.sh
# Date Created: Thu 17 Apr 2014 14:31:16 BST by seblovett on seblovett-Ubuntu
# <+Last Edited: Mon 12 May 2014 15:11:01 BST by seblovett on seblovett-Ubuntu +>
pdflatex -interaction=nonstopmode Report
if [ $? != 0 ]; then
	echo Build fail
	exit 1
fi
pdflatex Report
pdflatex Report
