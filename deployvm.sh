#!/bin/bash
set -euo pipefail

if [ ! "$#" = "1" ]; then
    echo "Usage: $0 <config file>"
fi

source $1

echo "Create $VM_NUM vms...."

for ((i=0;i<$VM_NUM;i++))
do
echo "pass $i"
let ip="$i+2"
    sudo xen-create-image --hostname=vm$i --memory=${MEM_MB}mb --vcpus=$Vcpu --bridge=$bridge \
--ip=10.0.0.$ip --gateway=10.0.0.1 --netmask=255.255.255.0 --size=${VDSize}gb --password=a \
--dir=$dir --genpass=0 --install-method=debootstrap --noswap

done
