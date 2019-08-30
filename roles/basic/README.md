Basic
=========

This role is designed to configure all basic stuff after network settings, such at ntp, locale, timezone, ssh, mail config and some basic packages installation.

Requirements
------------

This is usually the second role to run. After running both network basic and the following storage roles, you would have a basic cluster infrastructure.

Role Variables
--------------

`aptpacks` is apt packages installed on all nodes.
