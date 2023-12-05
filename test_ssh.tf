resource "null_resource" "ssh-tester" {
  depends_on = [oci_core_instance.this]
  count      = (var.is_testing_required) ? var.sever_count : 0

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
      "echo \"######################################################################################\"",
      "echo \" SERVER [${count.index}] SUCCESSFULLY CONNECTED. CHECKING SERVER CONFIGURATION .......\"",
      "echo \"######################################################################################\"",
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
      "echo \"SUCCESSFULLY COMPLETED SSH TEST AND CONFIGURATION CHECKS.   \"",
      "echo \"############################################################\"",
    ]
  }
}




resource "null_resource" "olinux-ssh-attempt" {
  depends_on = [oci_core_instance.this]
  count      = (var.is_testing_required) ? var.nb_of_ssh_attempts : 0

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
      "echo \"#####################################\"",
      "echo \" SERVER SUCCESSFULLY CONNECTED. .......\"",
      "echo \"#####################################\"",
    ]
  }
}


resource "null_resource" "olinux-ssh-access-failed-attempts" {

  depends_on = [oci_core_instance.this]
  count      = (var.is_testing_required) ? var.nb_of_failed_ssh_attempts : 0

  connection {
    timeout     = "1m"
    host        = oci_core_instance.mongodb-olinux[count.index].public_ip
    user        = "opc"
    private_key = file(var.ssh_private_key0)
  }

  provisioner "remote-exec" {
    inline = [
      "echo ",
      "echo \"############################################################\"",
      "echo \" UNSUCCESSFUL SSH CONNECTION ATTEMPTED .....\"",
      "echo \"############################################################\"",
      "echo ",
    ]
  }
}


