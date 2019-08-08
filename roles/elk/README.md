ELK
=========

This role is designed to configure a minimal ELK (elasticsearch+logstash+kibana+filebeat) stack for logging system. 
It also enables the user authetication of elastisearch.

Requirements
------------

Java 8 should be installed, which is done by `basic` role.

python3-passlib should be installed to confige http authetication, which is done by `ganglia` role

Role Variables
--------------

See defaults/main.yml. It is worth noting, when running the role at the first time to configure the whole stack, you should run it with filebeat_init as no and as yes each once. After the first run with filebeat_init as no, you can return to command line set es password by `sudo /usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive`. After this, run the role with filebeat_init as yes to finish the initial configurations. Afterward, you should keep filebeat_init to no, unless you want to reconfigure modules in filebeats.

Templates and Files
--------------

Notes
--------------

The initial configuration is in general referenced on [this post](https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elastic-stack-on-ubuntu-18-04#step-3-%E2%80%94-installing-and-configuring-logstash) with generalization to multiple distributed filebeats.

We further add multiple features from the minimal infrastructure: user authetication, multiple modules from filebeat, correct timestamps and no filters in logstash.

Also note nginx http authentication might be conflict with kibana intrinsic ones, so don't set http auth twice.