#!/bin/bash
set -euo pipefail

# Author: Sheng Wei
# Modified by Beichen Liu
# Version: Sept 30, 2016

source experimentSetup.mk


BENCHMARK_RES="result_read_vm"
POSTFIX=".dat"
TEMP="temp"


# Get each line of datafile
for i in `seq 1 $TIMES`; do
	echo -n "" > $TEMP$i$POSTFIX
	for j in `seq 0 $STOP`; do 
		sed -n "${i}{p;q;}" $BENCHMARK_RES$j$POSTFIX >> $TEMP$i$POSTFIX
	done
		cat $TEMP$i$POSTFIX | awk -v numofdatafiles=$i '{sum += $1; sumsq += ($1 * $1) } END {sqd = sumsq / NR - (sum / NR)^2; if(sqd < 10^-8) sqd = 0; print numofdatafiles  ", "sum / NR ", " sqrt(sqd)}' 
#		cat $TEMP$i$POSTFIX | awk -v numofdatafiles=$i '{sum += $1; sumsq += ($1 * $1) } END {print numofdatafiles  ", "sum / NR ", " sqrt( sumsq/NR - ( sum / NR) **2)}' 

done






