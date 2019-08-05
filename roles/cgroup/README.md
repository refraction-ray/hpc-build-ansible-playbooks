CGroup
=========

This role is designed to manage cgroup and resource limit by user or app basis.

Requirements
------------

You must have these user created defined in `cgrules.conf`. For example, ELK stack users restriction must be added after install of ELK stack.

Templates and Files
--------------

cgrules.conf and cgconfig.conf in files dir are very **specific**. You may want to change them based on your needs and your hardware specs. We only provide an example file named after `cgrules.conf.default`, you should rename the file without `.default` before applying the role.

Distribution related
---------------

It is worth noting, the cgroup auto classify system is very different in CentOS. So be careful on this role, if your distribution is not Ubuntu.
