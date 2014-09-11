TEMP_DIR = ../temp
RESULT_DIR = ../result
LATEX = pdflatex
BIBTEX = bibtex
MAKEINDEX = makeindex
FILE = thesis

all: $(TEMP_DIR) $(RESULT_DIR) \
	$(RESULT_DIR)/$(FILE).pdf 

clean:
	rm -rf $(TEMP_DIR)
	rm -rf $(RESULT_DIR)

$(TEMP_DIR)/$(FILE).pdf: $(FILE).tex *.tex
	cp literatur.bib $(TEMP_DIR)
	@$(LATEX) -draftmode -output-directory=$(TEMP_DIR) $(FILE).tex
	@cd $(TEMP_DIR) ; $(BIBTEX) $(FILE).aux 
	@cd $(TEMP_DIR) ; $(MAKEINDEX) $(FILE).idx
	@$(LATEX) -draftmode -output-directory=$(TEMP_DIR) $(FILE).tex > /dev/null
	@$(LATEX) -draftmode -output-directory=$(TEMP_DIR) $(FILE).tex > /dev/null
	@$(LATEX) -output-directory=$(TEMP_DIR) $(FILE).tex
	
$(RESULT_DIR)/thesis.pdf: $(TEMP_DIR)/$(FILE).pdf
	@cat $< > $@

$(TEMP_DIR):
	mkdir $(TEMP_DIR)

$(RESULT_DIR):
	mkdir $(RESULT_DIR)

.PHONY: clean all

