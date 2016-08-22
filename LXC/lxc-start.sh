#!/bin/bash

set -euo pipefail

if [ "$#" -gt 3 ];then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: ./lxc-start.sh docker 0 1"
    exit
fi


for i in `seq $2 $3`; do
    echo " starting $i"
    lxc-start -n $1$i -d   ||true
done


lxc-ls -f
