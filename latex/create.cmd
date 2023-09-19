@echo off
SET RESULT_DIR=..\result
SET FILE=thesis

cd tex
mkdir %RESULT_DIR%
pdflatex -synctex=1 -shell-escape --enable-write18 -draftmode %FILE%
makeindex -s %FILE%.ist -t %FILE%.alg -o  %FILE%.acr %FILE%.acn
makeindex -s  %FILE%.ist -t %FILE%.glg -o  %FILE%.gls %FILE%.glo
makeindex -s  %FILE%.ist -t %FILE%.slg -o  %FILE%.syi %FILE%.syg
biber %FILE%
pdflatex -synctex=1 -shell-escape --enable-write18 -draftmode %FILE%
pdflatex -synctex=1 -shell-escape --enable-write18 -draftmode -interaction batchmode %FILE%
pdflatex -synctex=1 -shell-escape --enable-write18 -interaction batchmode %FILE%
copy %FILE%.pdf %RESULT_DIR%\%FILE%.pdf
cd ..
