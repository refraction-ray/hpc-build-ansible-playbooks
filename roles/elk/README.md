ELK
=========

This role is designed to configure a minimal ELK(elasticsearch+logstash+kibana) stack for logging system.

Requirements
------------

Java 8 should be installed, which is done by `basic` role.

python3-passlib should be installed to confige http authetication, which is done by `ganglia` role

Role Variables
--------------

See defaults/main.yml. kibana_http_* vars are used for authticating web access.

Templates and Files
--------------

Notes
--------------

After finishing the role, you should further input the following two lines of command on master node to enable index template in ES and dashboard in kibana.

`sudo filebeat setup --template -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'`

`sudo filebeat setup -e -E output.logstash.enabled=false -E output.elasticsearch.hosts=['localhost:9200'] -E setup.kibana.host=localhost:5601`

The configuration is in general referenced on [this post](https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elastic-stack-on-ubuntu-18-04#step-3-%E2%80%94-installing-and-configuring-logstash) with slight generalization to multiple distributed filebeats.