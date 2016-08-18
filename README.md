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

Under ssh control, there are 
