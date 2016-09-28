#!/bin/bash
set -euo  pipefail 

if [ ! $# == 1 ]; then
	echo "Usage: $0 <config file>"
	exit
fi

source $1

echo -n "" > result_read_$(hostname).dat

for i in $(seq 1 $TIMES); do
    $RUN_CMDS $PREFIX $START $STOP /root/Xen_Scripts/postmark/result_read.sh
    wait
done

# 1. run the experiment once wait
# 2. create result
# 3. mkdir in host
# 4. scp result to host
#

