# Number of invocations of NPB benchs
NUM=21

# Number of OMP threads for each invocation
MAX_THREADS=4

# Named of the OMP benchs to launch
PROGS="ep.A.x  is.A.x  sp.A.x  ua.A.x  cg.A.x  ft.A.x  mg.A.x"

# Location of the OMP benchs (for native only, for VMs they are supposed to 
# be in the path)
PROGS_LOC="../../NPB3.3.1/NPB3.3-OMP/bin/"

# VM prefix (vm only)
PREFIX=vm

# Script to run cmds in multiple VMs (vm only)
RUN_CMDS="../../ssh-control/run_cmds.sh"

# Chrono is a simple tool to measure a command execution time
CHRONO="../../tools/chrono/chronoquiet"
