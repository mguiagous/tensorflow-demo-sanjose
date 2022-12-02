resource "null_resource" "ssh-tester" {
  depends_on = [oci_core_instance.this]
  count      = (var.is_testing_required) ? 1 : 0

  connection {
    agent       = false
    timeout     = "30m"
    host        = oci_core_instance.this[count.index].public_ip
    user        = "opc"
    private_key = file(var.ssh_private_key)
  }

  provisioner "remote-exec" {
    inline = [
      "echo ",
      "echo \"###### #######################################################\"",
      "echo \"SUCCESSFULLY CONNECTED TO SERVER. CHECKING SERVER CONFIG .....\"",
      "echo \"###############################################################\"",
      "echo ",
      "echo ",
      "echo \"====> Server Configuration\"",
      "uname -a",
      "echo ",
      "echo ",
      "echo \"====> Processor Information\"",
      "lscpu",
      "echo ",
      "echo ",
      "echo \"====> Hostname:\"",
      "hostname",
      "echo ",
      "echo ",
      "echo \"====> IP Address:\"",
      "curl ifconfig.co",
      "echo ",
      "echo ",
      "echo \"###### #################@@@@@@@@@@@@@@######################\"",
      "echo \"SUCCESSFULLY COMPLETED ACCESS TEST AND CONFIGURATION CHECKS.\"",
      "echo \"############################################################\"",
    ]
  }
}

