TEMP_DIR = ../temp
RESULT_DIR = ../result
LATEX = pdflatex
BIBTEX = biber
MAKEINDEX = makeindex
MAKEGLOSSARY = makeglossaries

INCLUDES = kapitel/abkuerzungen.tex kapitel/glossar.tex kapitel/symbole.tex docinfo.tex preambel.tex titelblatt.tex literatur.bib bilder/*.pdf hma.cls

CHAPTERS = kapitel/kapitel*.tex kapitel/anhang*.tex

TEMP_FILES = *.slg *.sls *.glg *.gls *.acr *.alg  *.bbl *.lol *.fdb_latexmk *.log *.synctex.gz *.fls *.idx *.lof *.lol *.lot *.toc *.acn *.glo *.run.xml *.slo *.syg *.bcf *.mw *.out *.aux *.glsdefs *.ist *.bbl *.blg *.ilg *.ind *.syi thesis.pdf thesis.run.xml thesis.synctex.gz

define latex-it
$(eval FILE = $(firstword $^))
@echo "Building $(FILE)"
@echo $(FILE)
@$(LATEX) -draftmode -output-directory=$(TEMP_DIR) $(FILE)
@cd $(TEMP_DIR) ; $(BIBTEX) $(basename $(FILE))
@cd $(TEMP_DIR) ; $(MAKEINDEX) $(basename $(FILE)).idx
@cd $(TEMP_DIR) ; $(MAKEGLOSSARY) $(basename $(FILE))
@$(LATEX) -draftmode -output-directory=$(TEMP_DIR) $(FILE) > /dev/null
@$(LATEX) -draftmode -interaction batchmode -output-directory=$(TEMP_DIR) $(FILE) > /dev/null
@$(LATEX) -interaction batchmode -output-directory=$(TEMP_DIR) $(FILE)
endef

.PHONY: all
all: $(TEMP_DIR) $(RESULT_DIR) \
	$(RESULT_DIR)/thesis.pdf

.PHONY: clean
clean:
	rm -rf $(TEMP_DIR)
	rm -rf $(RESULT_DIR)
	rm -f $(TEMP_FILES)

../thesis-overleaf.zip: * ../result/*
	latexmk -c
	-rm $(TEMP_FILES)
	@cd .. && zip -r thesis-overleaf.zip tex/*

$(TEMP_DIR)/thesis.pdf: thesis.tex $(INCLUDES) $(CHAPTERS)
	cp literatur.bib $(TEMP_DIR)
	$(latex-it)

$(RESULT_DIR)/thesis.pdf: $(TEMP_DIR)/thesis.pdf
	@cat $< > $@

$(TEMP_DIR):
	mkdir $(TEMP_DIR)

$(RESULT_DIR):
	mkdir $(RESULT_DIR)
