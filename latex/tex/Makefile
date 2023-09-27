RESULT_DIR = ../result
LATEX = pdflatex -synctex=1 -shell-escape --enable-write18 -interaction=nonstopmode
BIBTEX = biber
MAKEINDEX = makeindex
MAKEGLOSSARY = makeglossaries

INCLUDES = kapitel/abkuerzungen.tex kapitel/glossar.tex kapitel/symbole.tex abstrakt.tex docinfo.tex preambel.tex titlepage.sty literatur.bib bilder/*.pdf hma.cls

CHAPTERS = kapitel/kapitel*.tex kapitel/anhang*.tex

TEMP_FILES = *.slg *.sls *.glg *.gls *.acr *.alg  *.bbl *.lol *.fdb_latexmk *.log *.synctex.gz *.fls *.idx *.lof *.lol *.lot *.toc *.acn *.glo *.run.xml *.slo *.syg *.bcf *.mw *.out *.aux *.glsdefs thesis.ist *.bbl *.blg *.ilg *.ind *.loc *.soc *.syi thesis.pdf thesis.run.xml thesis.synctex.gz

define latex-it
$(eval FILE = $(firstword $^))
$(eval BASENAME = $(basename $(FILE)))
@echo "Building $(FILE)"
@echo $(FILE)
@$(LATEX) -draftmode $(FILE)
$(MAKEINDEX) -s $(BASENAME).ist -t $(BASENAME).alg -o  $(BASENAME).acr $(BASENAME).acn
$(MAKEINDEX) -s  $(BASENAME).ist -t $(BASENAME).glg -o  $(BASENAME).gls $(BASENAME).glo
$(MAKEINDEX) -s  $(BASENAME).ist -t $(BASENAME).slg -o  $(BASENAME).syi $(BASENAME).syg
$(BIBTEX) $(BASENAME)
@$(LATEX) -draftmode $(FILE) > /dev/null
@$(LATEX) -draftmode -interaction batchmode $(FILE) > /dev/null
@$(LATEX) -interaction batchmode $(FILE)
endef

.PHONY: all
all: $(RESULT_DIR)/thesis.pdf

.PHONY: clean
clean:
	rm -rf $(RESULT_DIR)
	rm -f $(TEMP_FILES)

../thesis-overleaf.zip: $(INCLUDES) $(CHAPTERS) thesis.tex
	rm -f $(TEMP_FILES)
	rm $@
	zip -r $@ .

thesis.pdf: thesis.tex $(INCLUDES) $(CHAPTERS)
	$(latex-it)

$(RESULT_DIR)/thesis.pdf: thesis.pdf
	mkdir -p $(RESULT_DIR)
	@cat $< > $@
