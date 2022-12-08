#!/usr/bin/bash
ansible-playbook playbook.yaml  -i tf_inventory.yaml -u opc --key-file /Users/mguiagou/.jenkins/cloudshellkey > log.out
