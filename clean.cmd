@echo off
SET RESULT_DIR=01_Thesis
SET OUTPUT_DIR=00_Output
SET FILE=thesis
cd tex
del /S /Q %OUTPUT_DIR%
rmdir %OUTPUT_DIR%
cd ..
del /S /Q %RESULT_DIR%
rmdir %RESULT_DIR%
DIR%
