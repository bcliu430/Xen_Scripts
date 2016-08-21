# Xen_Scripts

=======
This section is used to deploy, start, stop, delete Xen VM or docker, and install software and copy files to VM/docker.

##Xen PV:

###Deploy PV: 
To deploy an amount of pv, we need to use pv-deploy.sh and pv-deploy-config.mk to achieve. 
    Usage: ./pv-deploy.sh <config file>
In the configuration files, it contains the following parameters:
- PREFIX=vm 
- # VM name prefix
- ID=0                        
- # Start VM number
- XT_DIR=/root/xen-domains    
- # Deploy directory
- VM_NUM=1                    
- # Number of VMs that want to deploy
- MEMORY=1024                 
- # Memory size in MB
- DISK_SIZE=1                 
- # Hard disk size in GB
- VCPUS=1                    
- # Numeber of VCPU
- # Networking - the ip will be computed based on GATEWAY (first 3 numbers), and
- # BASE_IP_NUM. Fors example if we are creating 3 VMs, GATEWAY=10.0.0.1, and
- # BASE_IP_NUM=2, their ip will be 10.0.0.2, 10.0.0.3 and 10.0.0.4
- BRIDGE=xenbr0
- BASE_IP_NUM=2
- NETMASK=255.255.255.0
- GATEWAY=10.0.0.1
    
#####Start/Stop/Delete PV:
In order to start/stop/delete some PV, we need to use correspond script.
    Usage: $0 <prefix> <start> <stop>. $0 is the script for specific pv operation.
    Example: ./pv-start.sh vm 0 2. This will start vm0 to vm2. 

#####Under ssh control, there are two scripts used to run commands in virtual machine via ssh.
    run_cmd.sh ex: ./run_cmd.sh vm0 pwd. This will show the current working directory.
    run_cmds.sh ex: ./run_cmds vm 0 1 pwd. This will show the current working directory in vm0 and vm1.

#####install and copy are used to install or copy files to virtual machine.
    Usage: <shell script> <prefix> <start> <stop> <config file>
    Example: ./install.sh vm 0 1 install
    If you need to implement the config file, just put software name in the install file in a new line, 
    or put /path/from/source;path/to/target in the copy file.
    
##Docker:
    To deploy docker,Usage: $0 <prefix> <start> <stop>. Example: ./docker-deploy.sh doc 0 1" will deploy two dockers named doc0 and doc1.

To start, stop, or delete, use ./shell.sh <prefix> <start> <stop> (ex: ./docker-start(stop/delete).sh doc 0 1) to work on several dockers or ./shell.sh all (ex: ./docker-start(stop/delete).sh all) to work with all dockers.
    
    Right now, we are using nsenter to control the dockers. Usage is the same as Xen PV.
    docker_run_cmd.sh ex: ./docker_run_cmd.sh doc 0 pwd. This will show the current working directory.
    docker_run_cmds.sh ex: ./docker_run_cmds doc 0 1 pwd. This will show the current working directory in doc0 and doc1.
