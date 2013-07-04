VIEWER=evince

INPUT=thesis.tex

OUTPUT=thesis.pdf

.PHONY: $(OUTPUT)

all: $(OUTPUT)

$(OUTPUT): 
	latexmk -pdf -xelatex -use-make $(INPUT)

clean:
	latexmk -CA
	find . -name *.aux -or -name *.log -delete

view:
	$(VIEWER) $(OUTPUT) &
