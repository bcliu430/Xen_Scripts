#!/bin/bash

# set -euxo pipefail

SCRIPT_RUN_SINGLE="/root/scale/Xen_Scripts/ssh-control/run_cmd"


if [ "$#" -lt 4 ];then
    echo "Usage: $0 <prefix> <start> <stop> <config file>"
    echo "ex: ./install.sh vm 0 1 install"
    exit
fi

for i in `seq $2 $3`; do
    while IFS='' read -r line  ; do
        if [ "$line" != "" ] || [[ "$line" != "\#*" ]]; then
            [ "$SCRIPT_RUN_SINGLE $1$i $line" ]
        fi
    done < $4
done
#TODO
# - deal with comments if exists (check if line stats with #, if true just
#   skip it)
# - deal with empty line: if line == "" just skip it too
