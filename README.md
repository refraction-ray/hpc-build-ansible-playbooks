# HPC-BUILD-ANSIBLE-PLAYBOOKS

*Everyone can build his own supercomputer!*

## Glossary

HPC: High performance computation

Cluster: Many machines connected by switch on hardware level.

Node: One machine

Login node: Node that can be accessed from outside network

Master node: Node that run central services in the cluster. In our setup, login and master are the same node.

Compute nodes: Nodes for running jobs.

## Usage

Decomment the relevant roles you want to run in site.yml. You should review README file and task.yml carefully for each role you'd like to run.

```bash
$ cd <project-folder>
$ ansible-playbook -i hosts site.yml -Kvv ## enter sudo user password for the next prompt
```

### Some notes

* The playbooks should be located in a directory with permission 600 since it has lots of secret information and normal users shouldn't access them.

### Possible approach start from scratch

* Install OS on the master node and directly `apt install ansible`. Then git clone this repo somewhere locally. Configure the inventory files and host_vars to include all possible machines with the knowledge of their mac address.
* Possible a first Ansible run on master only with a complete inventory file (to generate complete hosts and mac-ip binding dhcp service). `network`, `basic` roles are suggested. A command `sudo ip addr add <lan_ip> dev <lan_nic>` is recommended before running network Ansible roles.
* Install OS on compute nodes, either by hand or by some bare metal provision mechanisms from the master. (Note the playbooks here doesn't cover setups of provisioning.)
* Make sure the sudo user with uid 1000 are the same (name, passwd) on all machines. And ensure ssh server is running  with admin's pubkey in authorized_keys on all machines.
* Plug all machines together by switch and run Ansible playbooks from beginning again on master. 

### Possible workflows beyond these playbooks

Ansible cannot do everything, and for some flexible and risky jobs, you may want to do them by hand directly.

* Mount local hard disk if there are any. Partition, format and mount them at master node. If there is any local mount need for compute nodes (which is rare for HPC style setup), you may want to add them to `basic` role, to make the world simple. This must be done before the running of `basic` role, which make the nfs mount possible.
* Disk quota initial configure if you want to limit users disk usage on certain filesystem. This must be done before the running of `user` role, where newly created user can automatically limit by quota.
* Manage slurm cluster, account, qos and user by `sacctmgr`, this can only be done after `slurm` role, when slurm is well configured and running. Besides, this should be done before `user` role, where new user can automatically be added to some account or limited by some qos policy.
* Install necessary external softwares for numerical computation, the common ones are Intel parallel studio, Mathematica and Matlab. Further manage and install packages by spack and conda provided by intel parallel studio.

### Limitations

These ansible playbooks here are very limited to a small cluster setup, where only one master/login node with possible several dozens of homogeneous compute nodes.

For a larger cluster setup, there should be more than one login nodes, and different master nodes may play different roles (some provide disk storage, some provide slurm database, some provide slurm controller, some provide bakup…). Besides, in such scale, the compute nodes are highly likely to be heterogeneous (some with big memory, some with GPU resource...), more detailed setups and carefully designed slurm configurations are needed in such scenario. It is in princinple OK to generalize our playbook for such large HPC clusters, but more effort should be paid instead of directly applying the playbooks here.

## Platform information

These ansible playbooks are not platform independent, instead, they are strongly correlated with Ubuntu 18.04 server distributions.

### Suggestions on the possible change for different platforms

* For different version of Ubuntu:
    - Some apt packages' name and config path might be different, especially these packages related to slurm.
    - Netplan may not work in old versions of Ubuntu.

* For totally different Linux distribution like CentOS:
    - Apt should be replaced with yum or some other package managers. 
    - Names of many packages and services might be changed.
    - Network setup might be in different approach.

* For OS beyond Linux:
    - You must be very experienced with these stuff. I have no specific suggetion for you:)
