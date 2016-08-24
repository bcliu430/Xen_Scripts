#!/bin/bash
set -euo pipefail

if [ ! $# == 1 ]; then
	echo "Usage: $0 <config file>"
	exit
fi

source $1

TMP_SCRIPT=.tmpscript

let last="$NUM-1"

for PROG in $PROGS; do
echo "" > $TMP_SCRIPT
chmod +x $TMP_SCRIPT
echo "#!/bin/bash" >> $TMP_SCRIPT
echo "export OMP_NUM_THREADS=${MAX_THREADS}" >> $TMP_SCRIPT
echo "for i in \`seq 0 ${last}\`; do" >> $TMP_SCRIPT
echo "	( ${PROGS_LOC}/${PROG} ) &" >> $TMP_SCRIPT
echo "done" >> $TMP_SCRIPT
echo "wait" >> $TMP_SCRIPT

	res=`$CHRONO ./$TMP_SCRIPT`
	echo "$PROG;$res"
done
rm $TMP_SCRIPT
