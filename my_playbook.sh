#!/usr/bin/bash
export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook /home/mail2maham/demo1/ansible/playbook.yaml  -i /home/mail2maham/demo1/ansible/tf_inventory.yaml -u opc --key-file ~/.ssh/cloudshellkey