# HPC-BUILD-ANSIBLE-PLAYBOOKS

Everyone can build his own supercomputer!

## Platform information

These ansible playbooks are not platform indepedent, instead, they are strongly correlated with Ubuntu 18.04 server distributions.

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
