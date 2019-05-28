User
=========

This role is designed to add new users on the cluster as easy as possible.

Requirements
------------

You must run `slurm` role first and have configured slurm cluster, account, user, qos info by `sacctmgr`.

If you use quota to limit normal users disk usage, you also need to firstly configure quota.

Role Variables
--------------

See defaults/main.yml. It is worth noting, for every user item, only name, password, and uid is necessary. Others will be the default value if not given.

Templates and Files
--------------
memory.conf and nproc.conf in files dir are very **specific**. You may want to change the specific limits based on your needs and your hardware specs.