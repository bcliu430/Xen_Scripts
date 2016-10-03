#!/bin/bash
set -euo  pipefail 

if [ ! $# == 1 ]; then
	echo "Usage: $0 <config file>"
	exit
fi

source $1


$RUN_CMDS $PREFIX $START $STOP rm pm-output ||true

rm -r ./result/

for i in $(seq 1 $TIMES); do
    $RUN_CMDS $PREFIX $START $STOP ./result_read.sh
done



for i in $(seq $START $STOP); do
    scp root@$PREFIX$i:result_read_$PREFIX$i.dat .
done

wait

./compute_mean_stddev.sh $STOP > result.csv

mkdir -p result

mv ./*.dat ./result.csv ./result/. 
