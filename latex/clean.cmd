@echo off
SET RESULT_DIR=..\result
SET FILE=thesis
SET TEMP_FILES="*.slg *.sls *.glg *.gls *.acr *.alg  *.bbl *.lol *.fdb_latexmk *.log *.synctex.gz *.fls *.idx *.lof *.lol *.lot *.toc *.acn *.glo *.run.xml *.slo *.syg *.bcf *.mw *.out *.aux *.glsdefs thesis.ist *.bbl *.blg *.ilg *.ind *.loc *.soc *.syi thesis.pdf thesis.run.xml thesis.synctex.gz"
cd tex
del /S /Q %RESULT_DIR%
rmdir %RESULT_DIR%
del /S /Q %TEMP_FILES%
cd ..
