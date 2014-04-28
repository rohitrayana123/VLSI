#!/bin/bash
# @file make.sh
# Date Created: Sun 13 Apr 2014 20:22:37 BST by seblovett on seblovett-Ubuntu
# <+Last Edited: Mon 28 Apr 2014 20:16:01 BST by seblovett on seblovett-Ubuntu +>
./../../bin/sim.py -h > simpy.txt
./../../bin/assemble.py -h > asmhelp.txt
pdflatex ProgGuide.tex
pdflatex ProgGuide.tex
pdflatex ProgGuide.tex
