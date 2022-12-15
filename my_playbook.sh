#!/usr/bin/bash
ansible-playbook ~/tensorflow-demo-sanjose/playbook.yaml  -i ~/tensorflow-demo-sanjose/tf_inventory.yaml -u opc --key-file ~/.ssh/cloudshellkey
