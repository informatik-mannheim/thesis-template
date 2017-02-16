@echo off
SET RESULT_DIR=..\result
SET OUTPUT_DIR=..\temp
SET FILE=thesis
cd tex
mkdir %RESULT_DIR%
mkdir %OUTPUT_DIR%
pdflatex -output-directory=%OUTPUT_DIR% -synctex=1 %FILE%.tex
biber %OUTPUT_DIR%\%FILE%
makeindex %OUTPUT_DIR%\%FILE%.idx
pdflatex -output-directory=%OUTPUT_DIR% -synctex=1 %FILE%.tex
pdflatex -output-directory=%OUTPUT_DIR% -synctex=2 %FILE%.tex
copy %OUTPUT_DIR%\%FILE%.pdf %RESULT_DIR%\%FILE%.pdf
cd ..
