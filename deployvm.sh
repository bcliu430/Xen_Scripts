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
        sudo xen-create-image \
        --hostname=vm$i \  #setup hostname
        --memory=${MEM_MB}mb \  # amount of memory
        --vcpus=$Vcpu \  # number of vcpu
        --bridge=$bridge \  # internet bridge
        --ip=10.0.0.$ip \  # assign ip address
        --gateway=10.0.0.1 \  # assign gateway
        --netmask=255.255.255.0 \  #assign netmask
        --size=${VDSize}gb \  #harddisk size
        --password=a \  #set default passwd
        --dir=$dir \  #installation directory
        --genpass=0 \ 
        --install-method=debootstrap \  # install method
        --noswap  #swap size

done
