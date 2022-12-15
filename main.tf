provider "oci" {}


data "oci_identity_fault_domains" "fds" {
    availability_domain = var.availability_domain
    compartment_id = var.compartment_ocid
}

locals {
 fds = data.oci_identity_fault_domains.fds.fault_domains
}


resource "oci_core_instance" "this" {

  count = var.sever_count

  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  
  availability_domain = var.availability_domain
  fault_domain = (var.availability_domain  != 0) ? lookup(local.fds[abs(var.fault_domain_number - 1)], "name") : lookup(local.fds[count.index % floor(min(2, 3))], "name")

  compartment_id      = var.compartment_ocid
  create_vnic_details {
    assign_private_dns_record = "true"
    assign_public_ip          = var.assign_public_ipaddress
    subnet_id                 = oci_core_subnet.My-Public-Subnet.id
  }
  display_name = "${var.display_name_prefix}-Server${count.index + 1}"
  instance_options {
    are_legacy_imds_endpoints_disabled = "false"
  }
  is_pv_encryption_in_transit_enabled = "true"
  metadata = {
    ssh_authorized_keys = "${file(var.ssh_public_key)}"
  }
  shape = "VM.Standard.E2.1.Micro"
  source_details {
    source_id   = var.image_ocid
    source_type = "image"
  }
}
