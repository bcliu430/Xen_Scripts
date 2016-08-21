# Xen_Scripts

<<<<<<< HEAD
TODO write doc for each script about how to use it + the format of the related configuration file if there is one.

=======
This section is used to deploy, start, stop, delete Xen VM or docker, and install software and copy files to VM/docker.

Xen PV:

Deploy PV: 
To deploy an amount of pv, we need to use pv-deploy.sh and pv-deploy-config.mk to achieve. 
    Usage: ./pv-deploy.sh <config file>
In the configuration files, it contains the following parameters:

Start/Stop/Delete PV:
In order to start/stop/delete some PV, we need to use correspond script.
    Usage: $0 <prefix> <start> <stop>. $0 is the script for specific pv operation.
    Example: ./pv-start.sh vm 0 2. This will start vm0 to vm2. 

Under ssh control, there are scripts that can run commands in different virtual machines.
    run_cmd.sh can run a single command on a single machine. Usage: ./run_cmd.sh vm0 date. This will automatically show the date on vm0.
    run_cmds.sh can run a single command on multiple machine. Usage: ./run_cmds.sh vm 0 1 date. This will show the date on vm0 and vm1.

    install.sh and install are used to install software on several PVs. 
    copy.sh and copy are used to copy files from and to the PVs.

Docker:
