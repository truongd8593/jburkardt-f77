#!/bin/bash
#
gfortran -c -g test_interp_1d_prb.f >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling test_interp_1d_prb.f"
  exit
fi
rm compiler.txt
#
gfortran test_interp_1d_prb.o -L$HOME/libf77/$ARCH -ltest_interp_1d -lr8lib
if [ $? -ne 0 ]; then
  echo "Errors linking and loading test_interp_1d_prb.o"
  exit
fi
rm test_interp_1d_prb.o
#
mv a.out test_interp_1d_prb
./test_interp_1d_prb > test_interp_1d_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running test_interp_1d_prb"
  exit
fi
rm test_interp_1d_prb
#
echo "Test program output written to test_interp_1d_prb_output.txt."
