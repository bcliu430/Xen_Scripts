#!/bin/bash

set -euo pipefail

if [ "$#" -gt 3 ];then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: ./lxc-stop.sh docker 0 1"
    exit
fi

for i in `seq $2 $3`; do
    echo " stoping $i"
    lxc-stop -n $1$i  ||true
done


lxc-ls -f

