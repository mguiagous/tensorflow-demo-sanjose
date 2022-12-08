resource "null_resource" "create-inventory" {
  depends_on = [oci_core_instance.this]
  count      = (var.is_website_installed) ? 1 : 0

  # Create inventory
  provisioner "local-exec" {
    command = "echo ${oci_core_instance.this.*.public_ip[0]} >> tf_inventory.yaml; echo ${oci_core_instance.this.*.public_ip[1]} >> tf_inventory.yaml"
  }
}

resource "null_resource" "run-ansible-playbook" {
  depends_on = [null_resource.create-inventory]
  count      = (var.is_website_installed) ? 1 : 0

  # Create inventory
  provisioner "local-exec" {
    command = "./Users/mguiagou/terraform-ws/demo/tensorflow-demo-sanjose/my-playbook.sh"
  }
}
