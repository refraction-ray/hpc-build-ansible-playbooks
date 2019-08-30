Storage
=========

This role is designed to configure storage stuff, including local mount, nfs and tmp clean.

Requirements
------------

This is the last of three roles to build cluster infrastructure, following network and basic.

Role Variables
--------------

See defaults/main.yml.

`tmp_time` is the time to delete files in tmp folder after the file's last change.
