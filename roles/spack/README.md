Spack
=========

This role will install spack, a flexible HPC package manager and configure it.

Requirements
-------------

You may want to config git by `git config --global url.https://github.com/.insteadOf git://github.com/` for air-gapped cluster, otherwise `spack install lmod` doesn't work since some of the dependences would be fetched by git which won't go through http proxy by default.


Role Variables
--------------

See defaults/main.yml. Only spack_path is needed, which specify the install path of spack. We highly recommend you install it on some admin user's home directory, which can be available for all users. For clusters, it is important to share /home on master to all nodes via nfs, such that spack is available to all nodes.

Templates and Files
--------------

It is worth noting that spack config yaml files in files dir are very **specific** and not universal at all. It assumes that you would install intel parallel studio on /opt dir. Especially, in packages.yaml, there is specific information on external packages' path which you may want to edit before running the role.
