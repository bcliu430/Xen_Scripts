#!/bin/bash

set -euxo pipefail

SCRIPT_RUN_SINGLE="/root/Xen_scripts/vm_run_cmd.sh"

source /root/Xen_scripts/conf.mk

if [ "$#" -lt 3 ];then
    echo "Usage: $0 <prefix> <start> <stop>"
    exit
fi

echo "$INSTALL"

for i in `seq $2 $3`; do
    $SCRIPT_RUN_SINGLE $1$i $INSTALL
done
