LATEXMK ?= latexmk

.PHONY: all pdf clean distclean

all: pdf

pdf:
	$(LATEXMK) -xelatex -interaction=nonstopmode -halt-on-error -file-line-error main.tex

clean:
	$(LATEXMK) -c main.tex

distclean:
	$(LATEXMK) -C main.tex
