# Network  & Load Balancer Variables
variable "vcn_cidr_block" {}
variable "subnet_cidr_block" {}
variable "host_name_prefix" {}
variable "is_loadbalancer_installed" {}
variable "lb_min_bandwith_in_mgps" {}
variable "lb_max_bandwith_in_mgps" {}

# Compute Instance Variables
variable "availability_domain" {}
variable "fault_domain_number" {}
variable "sever_count" {}
variable "compartment_ocid" {}
variable "image_ocid" {}
variable "display_name_prefix" {}
variable "assign_public_ipaddress" {}
variable "ssh_private_key" {}
variable "ssh_public_key" {}
variable "is_testing_required" {}
variable "is_website_installed" {}


