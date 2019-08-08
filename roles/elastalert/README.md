Elastalert
=========

This role is designed to integrate elastalert by Yelp into ELK stacks.

Requirements
------------

You must run `elk` role first to set up the ELK stack with elasticsearch database.
Also, you should setup index on elasticsearch by `elastalert-create-index`.

Templates and Files
--------------
Files in elastalert/rules should be added by hands, please refer to the doc of elastalert on how to write yaml files for alert rules.
