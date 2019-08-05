Drivers
=========

Install Nvidia drivers on nodes in [gn] group.

Role Variables
--------------

See defaults/main.yml. One should sepcify the driver versions, and it can be done in a more finer way, such as `driver_name: "nvidia-driver-418=418.56-0ubuntu0~gpu18.04.1"`.

Notes
--------------

After the installation of GPU drivers, a reboot is necessary. The reboot thing is not controlled by the role, so reboot the machines by hand.