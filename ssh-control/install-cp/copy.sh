#!/bin/bash

set -euxo pipefail

if [ ! "$#" = "4" ];then
    echo "Usage: $0 <prefix> <start> <stop> <config file>"
    exit
fi

while IFS='' read -r line; do
    echo $line
    source=`echo $line | sed -n "s/\(.*\)\;\(.*\)/\1/p"`
    target=`echo $line | sed -n "s/\(.*\)\;\(.*\)/\2/p"`

	# TODO do the actual copy here !
    echo "$source --> $target"

done < $4
