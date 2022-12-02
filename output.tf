output "display_name" { value = oci_core_instance.this.*.display_name }
output "public_ip_address" { value = oci_core_instance.this.*.public_ip }
output "private_ip_address" { value = oci_core_instance.this.*.private_ip }
output "testing_required" { value = var.is_testing_required }
output "weapp_installed" { value = var.is_website_installed }
output "Load-Balancer-IPs" { value = oci_load_balancer.this.*.ip_addresses }
 