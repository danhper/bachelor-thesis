.PHONY: thesis.pdf

all: thesis.pdf

thesis.pdf: thesis.tex
	latexmk -pdf -xelatex -use-make thesis.tex

clean:
	latexmk -CA
