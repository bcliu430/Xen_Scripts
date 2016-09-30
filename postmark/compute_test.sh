#!/bin/sh

# Author: Sheng Wei
# Version: Sept 30, 2016

# source experimentconfig.mk

if [ $# -ne 1 ]; then 
	echo "Usage <./compute_test> <number_of_datafiles> "
	exit
fi

#DATAFILE_NAME=$1;
NUMBER_OF_DATAFILES=$1;
NUMBER_OF_RUNS=5;
BENCHMARK_RES="result_read_vm"
POSTFIX=".dat"
TEMP="temp"


# Get each line of datafile
for i in `seq 1 $NUMBER_OF_RUNS`; do
	echo -n "" > $TEMP$i$POSTFIX
	for j in `seq 0 $1`; do 
		sed -n "${i}{p;q;}" $BENCHMARK_RES$j$POSTFIX >> $TEMP$i$POSTFIX
	done
		cat $TEMP$i$POSTFIX | awk -v numofdatafiles=$i '{sum += $1; sumsq += ($1 * $1) } END {print numofdatafiles  ", "sum / NR ", " sqrt( sumsq/NR - ( sum / NR) **2)}' 
	
done






