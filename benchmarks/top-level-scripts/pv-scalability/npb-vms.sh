#!/bin/bash
set -euo pipefail

if [ ! $# == 1 ]; then
	echo "Usage: $0 <config file>"
	exit
fi

source $1

FIRST=0
let LAST="$NUM-1"

for PROG in $PROGS; do
	echo -n "$PROG"
	res=`$CHRONO $RUN_CMDS $PREFIX $FIRST $LAST $PROG`
	echo ";$res"
done
