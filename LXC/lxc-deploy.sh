#!/bin/bash

set -euo pipefail

if [ "$#" -lt 3 ];then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: ./lxc-deploy.sh lxc 0 1"
    exit
fi

    for i in `seq $2 $3`; do
        echo " pass $i"
	lxc-create -n $1$i -t ubuntu -- -r trusty -a i386

done

lxc-ls
