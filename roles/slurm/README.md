Slurm
=========

This role is designed to set up the whole slurm service, including slurmctld slurmd and slurmdbd from scratch. It also enable the pam module which deny user ssh to compute node when there is no job of them there.

Role Variables
--------------

See defaults/main.yml. 

Templates and Files
--------------
slurm.conf in templates dir may need further review to meet your specifc needs. For example, the default conf only has one partition, you may want to add more partitions or change Weight of nodes as you like. The current conf also includes the master node as a compute node, too. You may also want to exclude it. 

Besides, pay special attention on the config path if your OS is not Ubuntu 18.04, the path may vary for different distributions. And you need to change path relevant confs by hands.