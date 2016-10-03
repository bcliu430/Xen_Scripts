#!/bin/bash
set -euo pipefail

XEN_DOMAINS_DIR=/root/xen-domains/domains
BRIDGE=xenbr0
DISK_IMG=disk.img
GATEWAY=10.0.0.1

if [ ! $# == 3 ]; then
	echo "Usage: $0 <source vm> <target vm> <target ip>"
	exit
fi

if [ ! -d $XEN_DOMAINS_DIR/$1 ]; then
	echo "Cannot find VM xen-tools folder, tried $XEN_DOMAINS_DIR/$1."
	exit
fi

if [ ! -e /etc/xen/${1}.cfg ]; then
	echo "Cannot find VM conf file, tried /etc/xen/${1}.cfg."
	exit
fi

# TODO check existence

#1. Copy cfg
cfg=/etc/xen/${2}.cfg
cp -f /etc/xen/${1}.cfg $cfg

#2. edit cfg
sed -i s/^.*vif.*$/"vif = \[ \'bridge=xenbr0\' \]"/ $cfg
sed -i s/"^name .*$"/"name = '$2'"/ $cfg
sed -ri "s/(file:.*)($1)(.*)$/\1$2\3/" $cfg

#3. copy image
mkdir $XEN_DOMAINS_DIR/$2
cp -r $XEN_DOMAINS_DIR/$1/$DISK_IMG $XEN_DOMAINS_DIR/$2/$DISK_IMG

root=$XEN_DOMAINS_DIR/$2/mnt/
mkdir $root
mount $XEN_DOMAINS_DIR/$2/$DISK_IMG $root

echo $2 > $root/etc/hostname
if=$root/etc/network/interfaces
echo "" > $if
echo "auto lo" >> $if
echo "iface lo inet loopback" >> $if
echo "auto eth0" >> $if
echo "iface eth0 inet static" >> $if
echo " address ${3}" >> $if
echo " gateway ${GATEWAY}" >> $if
echo " netmask 255.255.255.0" >> $if

hosts=$root/etc/hosts
echo "" > $hosts
echo "127.0.0.1	localhost" >> $hosts
echo "$3	$2 $2" >> $hosts

echo "$3	$2 $2" >> /etc/hosts

umount $root
rm -r $root


