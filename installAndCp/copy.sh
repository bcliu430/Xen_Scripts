#!/bin/bash

set -euxo pipefail

if [ ! "$#" = "4" ];then
    echo "Usage: $0 <prefix> <start> <stop> <config file>"
    exit
fi

while IFS='' read -r line; do
    for i in 'seq $2 $3'; do
        # set FS to \t; will change this to other after I finish the code
        # awk -F '\t' 'echo $0 root@$1$i $1':'' copy' $1
        # Here I am confused about the field
        # I want to do things like $0 root@$1$i $1 
        # But the first $0 and the last $1 is in the config file and $1$i is the field in bash
    done
done < $1


