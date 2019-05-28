Basic
=========

This role is designed to configure all basic stuff after network settings, such at nfs, ntp, locale, timezone, ssh config and some basic packages installation.

Requirements
------------

This is usually the second role to run. After running both network and basic roles, you would have a basic cluster infrastructure.

Role Variables
--------------

See defaults/main.yml. extra_mounts is nfs dirs outside both login and compute machines which need mount in all nodes. nft_dir is nfs dirs on the master node to be mounted by compute nodes.