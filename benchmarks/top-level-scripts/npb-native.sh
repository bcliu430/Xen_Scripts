#!/bin/bash
set -euo pipefail

NUM=21
MAX_THREADS=4

PROGS="bt.A.x  ep.A.x  lu.A.x  is.A.x  sp.A.x  ua.A.x  cg.A.x  ft.A.x  mg.A.x"
PROGS_LOC="../NPB3.3.1/NPB3.3-OMP/bin/"

CHRONO="../tools/chrono/chronoquiet"

TMP_SCRIPT=.tmpscript

export OMP_THREADS_NUMS=$MAX_THREADS

let last="$NUM-1"

for PROG in $PROGS; do
echo "" > $TMP_SCRIPT
chmod +x $TMP_SCRIPT
echo "#!/bin/bash" >> $TMP_SCRIPT
echo "export OMP_THREADS_NUMS=${MAX_THREADS}" >> $TMP_SCRIPT
echo "for i in \`seq 0 ${last}\`; do" >> $TMP_SCRIPT
echo "	( ${PROGS_LOC}/${PROG} ) &" >> $TMP_SCRIPT
echo "done" >> $TMP_SCRIPT
echo "wait" >> $TMP_SCRIPT

	res=`$CHRONO ./$TMP_SCRIPT`
	echo "$PROG;$res"
done
rm $TMP_SCRIPT
