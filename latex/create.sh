#!/bin/sh
RESULT_DIR="../result"
FILE="thesis"

cd tex
pdflatex -synctex=1 -shell-escape --enable-write18 -draftmode $FILE
makeindex -s $FILE.ist -t $FILE.alg -o  $FILE.acr $FILE.acn
makeindex -s  $FILE.ist -t $FILE.glg -o  $FILE.gls $FILE.glo
makeindex -s  $FILE.ist -t $FILE.slg -o  $FILE.syi $FILE.syg
biber $FILE
pdflatex -synctex=1 -shell-escape --enable-write18 -draftmode $FILE > /dev/null
pdflatex -synctex=1 -shell-escape --enable-write18 -draftmode -interaction batchmode $FILE > /dev/null
pdflatex -synctex=1 -shell-escape --enable-write18 -interaction batchmode $FILE
mkdir -p $RESULT_DIR
cat ${FILE}.pdf > $RESULT_DIR/${FILE}.pdf
cd ..
