#!/bin/bash
#
gfortran -c -g sparsekit_prb01.f >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling sparsekit_prb01.f"
  exit
fi
rm compiler.txt
#
gfortran sparsekit_prb01.o -L$HOME/libf77/$ARCH -lsparsekit
if [ $? -ne 0 ]; then
  echo "Errors linking and loading sparsekit_prb01.o"
  exit
fi
rm sparsekit_prb01.o
#
mv a.out sparsekit_prb01
./sparsekit_prb01 > sparsekit_prb01_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running sparsekit_prb01"
  exit
fi
rm sparsekit_prb01
#
echo "Program output written to sparsekit_prb01_output.txt"
