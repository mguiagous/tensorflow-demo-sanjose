#!/usr/bin/bash
/usr/local/bin/ansible-playbook /Users/mguiagou/terraform-ws/demo/tensorflow-demo-sanjose/playbook.yaml  -i /Users/mguiagou/terraform-ws/demo/tensorflow-demo-sanjose/tf_inventory.yaml -u opc --key-file /Users/mguiagou/.jenkins/cloudshellkey > log.out
