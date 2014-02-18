pdflatex Subroutines.tex
makeindex -s Subroutines.ist -t Subroutines.alg -o Subroutines.acr Subroutines.acn 
bibtex Subroutines
pdflatex Subroutines.tex 
pdflatex Subroutines.tex 
texcount -v -html -inc Subroutines.tex > count.html
del .pdf
del *.aux
del *.bbl
del *.blg
del *.log
del *.synctex.gz
del *.toc

