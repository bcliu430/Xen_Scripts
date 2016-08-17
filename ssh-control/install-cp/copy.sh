#!/bin/bash

set -euo pipefail

if [ ! "$#" = "4" ];then
    echo "Usage: $0 <prefix> <start> <stop> <config file>"
    exit
fi

while IFS='' read -r line; do
    echo $line
    source=`echo $line | sed -n "s/\(.*\)\;\(.*\)/\1/p"`
    target=`echo $line | sed -n "s/\(.*\)\;\(.*\)/\2/p"`
<<<<<<< HEAD:installAndCp/copy.sh
   
    for i in `seq $2 $3`; do
        #scp $source "root@$1$i:"$target
        echo "$source --> "root@$1$i:"$target" 
    done
=======

	# TODO do the actual copy here !
    echo "$source --> $target"

>>>>>>> 296ef2a508c5bdefc18ba1a96fa37987e777c3fa:ssh-control/install-cp/copy.sh
done < $4
