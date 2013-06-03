# $Id: Makefile,v 1.2 2002/11/15 17:45:27 dsm Exp $

## don't use builtin implicit rules

MAKEFLAGS = -r

## define custom suffixes

.SUFFIXES:
.SUFFIXES: .tex


## LaTeX

PDFLATEX = pdflatex
BIBTEX = bibtex

## default target

DOC = \
    spead_protocol.pdf\
    spead_data_interface.pdf

.PHONY: all
all: $(DOC)


## dependencies

## miscellaneous targets

.PHONY: spell
spell:
	@aspell -c -t --lang=en_UK *.tex

.PHONY: clean
clean:
	@rm -f *~ *.log

.PHONY: squeaky
squeaky: clean
	@rm -f *.aui *.aux *.bbl *.blg
	@rm -f headers/*.aux

.PHONY: clobber
clobber: squeaky
	@rm -f *.dvi *.bak *.toc *.lof *.lot *.out

.PHONY: distclean
distclean: clobber
	@rm -f $(DOC)

.PHONY: realclean
realclean: distclean
	@


## implicit rules

%.pdf: %.tex
	$(PDFLATEX) $(subst .tex,,$<)
	$(BIBTEX) $(subst .tex,,$<)
	$(PDFLATEX) $(subst .tex,,$<)
	$(PDFLATEX) $(subst .tex,,$<)

## don't try to make the makefile..

Makefile: ;


## -fin-
# vim:set syntax=make:
