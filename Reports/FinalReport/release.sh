#!/bin/bash
# @file release.sh
# Date Created: Mon 12 May 2014 15:05:34 BST by seblovett on seblovett-Ubuntu
# <+Last Edited: Mon 12 May 2014 15:13:33 BST by seblovett on seblovett-Ubuntu +>

echo Release build for the report
echo :%s/draft,/:x >> release.vim
vim -s release.vim Report.tex
echo Removed draft option in tex
rm release.vim
./make.sh
if [ $? != 0 ]; then
	git checkout -- Report.tex
	exit 1
fi
git checkout -- Report.tex

