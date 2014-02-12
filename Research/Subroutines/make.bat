del Subroutines.pdf
del Subroutines.blg
del Subroutines.log
del Subroutines.synctex.gz
del Subroutines.toc
pdflatex -synctex=1 Subroutines.tex 
makeindex -s Subroutines.ist -t Subroutines.alg -o Subroutines.acr Subroutines.acn 
bibtex Subroutines 
pdflatex -synctex=1 Subroutines.tex 
pdflatex -synctex=1 Subroutines.tex 
texcount -v -html -inc Subroutines.tex > count.html
echo Complete!
