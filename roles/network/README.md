Network
=========

This role is designed to configure the network of the cluster including master as dns and dhcp server in LAN, NAT enable network on compute nodes and some proxy settings.

Requirements
------------

No requirement as long as admin user account are consistent across machines. It is actually the first role to run, which make the cluster accessible and network connected.

Role Variables
--------------

See defaults/main.yml. You need to specify set_proxy to no, if your system is not air-gapped and free to connect to the internet.

Templates and Files
--------------
sources.list in files dir changes the default apt source to a mirror. You may want to change this behavior depending on your own network conditions.

hosts in templates dir has some extra host items. You may want to delete or change this depending on your system.