VIEWER=evince

INPUT=thesis.tex

OUTPUT=thesis

PRINT=thesis_print

.PHONY: $(OUTPUT) $(PRINT)

all: 
	latexmk -pdf -xelatex -jobname=$(OUTPUT) -use-make $(INPUT)

print: 
	latexmk -pdf -dvi- -jobname=$(PRINT) -pdflatex="xelatex %O '\def\printthesis{}\input{%S}'" $(INPUT)

clean:
	latexmk -CA -jobname=$(OUTPUT)
	latexmk -CA -jobname=$(PRINT)
	find . -name *.aux -or -name *.log -delete
	rm *.bbl

view:
	$(VIEWER) $(OUTPUT).pdf &

view-print:
	$(VIEWER) $(PRINT).pdf &
