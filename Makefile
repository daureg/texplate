NAME	=	rapport
CTEX	=	xelatex
TEXFLAGS=	-synctex=1 #--interaction=nonstopmode
BIB	=	biber
GLOS	=	makeglossaries
PDFVIEW	=	zathura
all: $(NAME).pdf $(NAME).bbl $(NAME).gls
	$(CTEX) $(TEXFLAGS) $(NAME).tex
$(NAME).pdf:
	$(CTEX) $(TEXFLAGS) $(NAME).tex
$(NAME).bbl: $(NAME).bib
	$(BIB) $(NAME)
$(NAME).gls: glossaire.tex
	$(GLOS) $(NAME)
see:
	$(PDFVIEW) $(NAME).pdf
clean:
	rm -f *.{aux,bbl,bcf,blg,glg,glo,gls,lof,log,lot,out,synctex.gz,toc,xdy,xml}
distclean: clean
	rm -f $(NAME).pdf
