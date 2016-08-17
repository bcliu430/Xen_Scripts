#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_RUN_SINGLE="$SCRIPT_DIR/run_cmd.sh"

# Check if the "run single script is present"
if [ ! -e $SCRIPT_RUN_SINGLE ]; then
	echo "Error, cannot find single cmd running script (tried $SCRIPT_RUN_SINGLE)"
	exit

exit

if [ "$#" -lt 4 ]; then
	echo "usage: $0 <prefix> <start> <stop> <cmd>"
	exit
fi

for i in `seq $2 $3`; do
	( ssh root@$1$i ${*:4} 2>&1 | sed "s/^/[$1$i] /" ) &
done
wait
