# Makefile per compilare il documento LaTeX con XeLaTeX e BibLaTeX/Biber

# Nome del file principale LaTeX (senza l'estensione .tex)
FILENAME ?= main

# Comandi per i tool
LATEX = xelatex
# --- MODIFICA 1: Sostituiamo bibtex con biber ---
# Il vecchio comando era: BIBTEX = bibtex
BIBER = biber

# Opzioni per il compilatore LaTeX
LATEX_OPTIONS = --halt-on-error

# Target predefinito: compila il documento
all: $(FILENAME).pdf

# Regola per compilare il documento LaTeX
$(FILENAME).pdf: $(FILENAME).tex
	$(LATEX) $(LATEX_OPTIONS) $(FILENAME).tex
# --- MODIFICA 2: Usiamo biber al posto di bibtex ---
	$(BIBER) $(FILENAME)
	$(LATEX) $(LATEX_OPTIONS) $(FILENAME).tex
	$(LATEX) $(LATEX_OPTIONS) $(FILENAME).tex

# Pulisce i file temporanei generati durante la compilazione
clean:
	rm -f $(FILENAME).aux $(FILENAME).log $(FILENAME).out $(FILENAME).toc \
	      $(FILENAME).lof $(FILENAME).lot \
	      $(FILENAME).bbl $(FILENAME).blg $(FILENAME).bcf *.run.xml

# Pulisce completamente i file intermedi e il PDF finale
clean-all: clean
	rm -f $(FILENAME).pdf

# Specifica i target che non sono file
.PHONY: all clean clean-all