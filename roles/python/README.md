Python
=========

This role is designed to make a compatible python enviroment.

Requirements
------------

You should first install intel parallel studio with intel python, if you want to enable the last two tasks in the playbook. The workflow in general here is to make intelpython as the default python for numerical calculations. If that is not what you want to implement, review carefully and delete irrelevant tasks.

Role Variables
--------------

See defaults/main.yml. You need to specify spack_path if you want intel python auto include spack pip packages.

Templates and Files
--------------
pip.conf in files dir changes the default pypi url to a mirror. You may want to change this behavior depending on your network conditions.