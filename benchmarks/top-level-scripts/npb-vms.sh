#!/bin/bash
set -euo pipefail

PREFIX=vm
FIRST=0
LAST=20
PROGS="bt.A.x  ep.A.x  lu.A.x  is.A.x  sp.A.x  ua.A.x  cg.A.x  ft.A.x  mg.A.x"

CHRONO="../tools/chrono/chronoquiet"
RUN_CMDS="../../ssh-control/run_cmds.sh"

for PROG in $PROGS; do
	echo -n "$PROG"
	res=`$CHRONO $RUN_CMDS $PREFIX $FIRST $LAST $PROG`
	echo ";$res"
done
