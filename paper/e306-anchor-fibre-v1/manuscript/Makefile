LATEXMK ?= latexmk

.PHONY: all pdf garamond comparison clean distclean

all: pdf

pdf:
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex

garamond:
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -file-line-error main-garamond.tex

comparison: pdf garamond

clean:
	$(LATEXMK) -c main.tex
	$(LATEXMK) -c main-garamond.tex

distclean:
	$(LATEXMK) -C main.tex
	$(LATEXMK) -C main-garamond.tex
