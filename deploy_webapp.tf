resource "null_resource" "create-inventory" {
  depends_on = [oci_core_instance.this]
  count      = (var.is_website_installed) ? 1 : 0

  # Create inventory
  provisioner "local-exec" {
    command = "ls -ltr"
    #command = "echo ${oci_core_instance.this.*.public_ip[0]} >> ansible-src/tf_inventory.yaml; echo ${oci_core_instance.this.*.public_ip[1]} >> ansible-src/tf_inventory.yaml"
  }
}

resource "null_resource" "run-ansible-playbook" {
  depends_on = [null_resource.create-inventory]
  count      = (var.is_website_installed) ? 1 : 0

  # Create inventory
  provisioner "local-exec" {
    command = "cd ansible-src; ./my-playbook.sh"
  }
}
