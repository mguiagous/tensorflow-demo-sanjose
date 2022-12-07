provider "oci" {}

resource "oci_core_instance" "this" {

  count = var.sever_count

  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  availability_domain = var.availability_domain
  fault_domain        = var.fault_domain  
  compartment_id      = var.compartment_ocid
  create_vnic_details {
    assign_private_dns_record = "true"
    assign_public_ip          = var.assign_public_ipaddress
    subnet_id                 = var.subnet_ocid
  }
  display_name = "${var.display_name_prefix} Server ${count.index + 1}"
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
