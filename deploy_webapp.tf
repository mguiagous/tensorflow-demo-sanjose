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
  depends_on = [ null_resource.create-inventory ]
  count      = (var.is_website_installed) ? 1 : 0

  # Create inventory
  provisioner "local-exec" {
    command = "cd ansible-src; ./my-playbook.sh"
  }
}


/*
resource "null_resource" "webapp-installer" {
  depends_on = [oci_core_instance.this]
  count      = (var.is_website_installed) ? var.sever_count : 0

  connection {
    agent       = false
    timeout     = "30m"
    host        = oci_core_instance.this[count.index].public_ip
    user        = "opc"
    private_key = file(var.ssh_private_key)
  }
*/

/*
  provisioner "remote-exec" {
    inline = [
      "echo ",
      "echo \"###### #######################################################\"",
      "echo \"# INSTALL JOOMLA/NGINIX, CONFIGURE IT AND SHOW WEB SITE INDEX.  # \"",
      "echo \"###############################################################\"",
      "echo ",
      "echo \"====> Updating and Upgrading yum\"",
      "sudo yum -y update",
      "sudo yum upgrade",
      "sudo yum install yum-utils unzip wget",
      "echo ",
      "echo \"====> Install NGINIX Web Server  *********************\"",
      "echo ",
      "sudo yum install nginx",
      "echo \"Starting and/or Stopping Nginx\"",
      "Start Nginx: sudo service nginx start",
      "sudo service nginx restart",
      "echo \"###### #################@@@@@@@@@@@@@@#####################################\"",
      "echo \"# SUCCESSFULLY INSTALLED JOOMLA SITE - GO TO YOUR PUBLIC IP AND TRY IT!   #\"",
      "echo \"###########################################################################\"",
    ]
  }
}
*/


/*
  provisioner "remote-exec" {
    inline = [
      "echo ",
      "echo \"###### #######################################################\"",
      "echo \"# INSTALL APACHE AND CONFIGURE FIREWALL AND WEB SITE INDEX.  # \"",
      "echo \"###############################################################\"",
      "echo ",
      "echo \"====> Updating and Upgrading yum\"",
      #"sudo yum -y update",
      #"sudo yum upgrade",
      "echo ",
      "echo \"====> Install Apache Web Server  *********************\"",
      "sudo yum install -y httpd",
      "echo \"====> Start HTP Deamon *******************************\"",
      "sudo systemctl start httpd",
      "echo \"====> Enbale HTP Deamon ******************************\"",
      "sudo systemctl enable httpd",
      "echo \"====> Open Required Firewalls ************************\"",
      "sudo firewall-cmd --permanent --add-service=http",
      "sudo systemctl enable firewalld",
      "sudo systemctl restart firewalld",
      "sudo systemctl start httpd.service",
      #"sudo systemctl status httpd.service",
      "echo \"====> Download webserver installer and images from OCI Object Storage\"",
      "rm -r downloads",
      "mkdir downloads",
      "cd downloads",
      "wget https://objectstorage.us-sanjose-1.oraclecloud.com/p/jImdRx1ENKE3N7xNXdZAByASa5h43cUxgjllSW4jVW3JLdzvPqnqkYAAUxm_9XbX/n/ax1qybrxcvtj/b/web-sites/o/OneClick.pdf",
      "wget https://objectstorage.us-sanjose-1.oraclecloud.com/p/HTePsHVWFNT6thDsFToXW4bqE8cJqRp2x737KbUPjI3CGyNfkqPwmKuNfmlkVvFF/n/ax1qybrxcvtj/b/web-sites/o/create_website_index_html.sh",
      "wget https://objectstorage.us-sanjose-1.oraclecloud.com/p/BwkaCWFiKaHObvm9hPbiAa6ME6mWPTMwULZXkrtJ--4UT5YvMoHwhyB2gdTnisAi/n/ax1qybrxcvtj/b/web-sites/o/oracleacademy.jpg",
      "wget https://objectstorage.us-sanjose-1.oraclecloud.com/p/pVBNeImQ9CihP6cv0O1vQi0eBg6xIDDamBymkzR5oWP33jZnyx30OcxV_Sq3E_Zs/n/ax1qybrxcvtj/b/web-sites/o/poweredbyoci.jpg",
      "wget https://objectstorage.us-sanjose-1.oraclecloud.com/p/TR9EGYEDNsEVZcwIwK1caX1TrCiil29fqMtFPSronlLgMBwCaonlh07sm1vV0wxc/n/ax1qybrxcvtj/b/web-sites/o/tensorflowdemo.gif",
      "echo ",
      "echo ",
      "echo \"====> Verify the installer script is downloaded\"",
      "ls -ltr",
      "echo ",
      "echo ",
      "echo \"====> Change execuipon mode :\"",
      "chmod +x create_website_index_html.sh",
      "echo ",
      "echo ",
      "sudo rm /var/www/html/index.html",
      "echo \"====> Execute the installer\"",
      "sudo ./create_website_index_html.sh",
      "echo ",
      "echo ",
      "echo \"Creating images and labs direvtory under /var/www/html\"",
      "echo ",
      "echo \"===> Create images directory under /var/www/html\"",
      "echo ",
      "echo ",
      "sudo rm -r /var/www/html/images",
      "sudo mkdir /var/www/html/images",
      "cd /var/www/html/images",
      "ls -ltr",
      "echo \"===> Copying all file used by the website template\"",
      "echo ",
      "echo ",
      "sudo cp /home/opc/downloads/oracleacademy.jpg  /var/www/html/images/oracleacademy.jpg",
      "ls -ltr",
      "echo ",
      "echo ",
      "sudo cp /home/opc/downloads/ets_logo.jpg  /var/www/html/images/ets_logo.jpg",
      "ls -ltr",
      "echo ",
      "echo ",
      "sudo rm -r /var/www/html/labs",
      "sudo mkdir /var/www/html/labs",
      "sudo cp /home/opc/downloads/OneClick.pdf /var/www/html/labs/OneClick.pdf",
      "ls -ltr",
      "echo ",
      "echo ",
      "sudo cp /home/opc/downloads/poweredbyoci.jpg /var/www/html/images/poweredbyoci.jpg",
      "ls -ltr",
      "echo ",
      "sudo cp /home/opc/downloads/tensorflowdemo.gif /var/www/html/images/tensorflowdemo.gif",
      "echo ",
      "echo \"###### #################@@@@@@@@@@@@@@#####################################\"",
      "echo \"# SUCCESSFULLY INSTALLED WEB SITE - MAKE SURE PORT 80 IS OPEN AND TRY IT! #\"",
      "echo \"###########################################################################\"",
    ]
  }
}
*/