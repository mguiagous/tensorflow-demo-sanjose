resource "null_resource" "create-inventory" {
  depends_on = [oci_core_instance.this]
  count      = (var.is_website_installed) ? 1 : 0

  # Create inventory
  provisioner "local-exec" {
    command = "echo ${oci_core_instance.this.*.public_ip[0]} >> /Users/mguiagou/terraform-ws/demo/tensorflow-demo-sanjose/tf_inventory.yaml; echo ${oci_core_instance.this.*.public_ip[1]} >> /Users/mguiagou/terraform-ws/demo/tensorflow-demo-sanjose/tf_inventory.yaml"
  }
}

resource "null_resource" "run-ansible-playbook" {
  depends_on = [null_resource.create-inventory]
  count      = (var.is_website_installed) ? 1 : 0

  # Create inventory
  provisioner "local-exec" {
    command = "/usr/local/bin/ansible-playbook /Users/mguiagou/terraform-ws/demo/tensorflow-demo-sanjose/playbook.yaml  -i /Users/mguiagou/terraform-ws/demo/tensorflow-demo-sanjose/tf_inventory.yaml -u opc --key-file /Users/mguiagou/.jenkins/cloudshellkey"
  }
}
