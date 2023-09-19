#!/bin/sh
RESULT_DIR="result"
FILE="thesis"
TEMP_FILES="*.slg *.sls *.glg *.gls *.acr *.alg  *.bbl *.lol *.fdb_latexmk *.log *.synctex.gz *.fls *.idx *.lof *.lol *.lot *.toc *.acn *.glo *.run.xml *.slo *.syg *.bcf *.mw *.out *.aux *.glsdefs thesis.ist *.bbl *.blg *.ilg *.ind *.loc *.soc *.syi thesis.pdf thesis.run.xml thesis.synctex.gz"
rm -rf $RESULT_DIR
cd tex
rm $TEMP_FILES
