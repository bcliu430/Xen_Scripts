#!/bin/bash
set -euo  pipefail 

if [ ! $# == 1 ]; then
	echo "Usage: $0 <config file>"
	exit
fi

source $1


for i in "seq 1 $TIMES"; do

done

# 1. run the experiment once wait
# 2. create result
# 3. mkdir in host
# 4. scp result to host
#

