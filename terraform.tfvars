# This is the only file to be maintained
#
# Number of servers
sever_count = 2
#
# Compartement OCID
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaabliehdjgxojzrpisiode2ujuird3zgn5edvaitsn6x4aolvntsia"
#
# Availability Domain and Fault Domain Name
availability_domain = "GqIF:PHX-AD-1"
fault_domain        = "FAULT-DOMAIN-1"
#
# "ocid1.image.oc1........"
image_ocid = "ocid1.image.oc1.phx.aaaaaaaaos6adgpwq24wy4f2hnk2adadawkd2qs6nmtxjvh34r77riwrqarq"
#
# Display Name Prefix
display_name_prefix = "1-Click-Demo"
#
# Public ssh key path
ssh_public_key = "/Users/mguiagou/.jenkins/cloudshellkey.pub"
#
# Private ssh key path
ssh_private_key = "/Users/mguiagou/.jenkins/cloudshellkey"
#
# Assigned Public IP
assign_public_ipaddress = true
#
# Subnet OCID (DemoVCN)
subnet_ocid = "ocid1.subnet.oc1.phx.aaaaaaaa6zvlok2q43cu2yw3hjqtbmnr4m5axaw2tj75yq6xjg6aruc4tr4q"
#
network_security_group_id = "ocid1.networksecuritygroup.oc1.iad.aaaaaaaa5ew5x7qeu6adutpjeu5kaafsihf7xj4mpwqikhnw2tbn746thnda"
#
# Flag to turn on ssh access and configuraiton check
is_testing_required = false
#
# Flag to configure an appache web server and a demo website 
is_website_installed = true
#
# Flag to configure a ffelxible load balancer for the demo website HA scenario 
is_loadbalancer_installed = true
#
# Flag to configure an appache web server and a demo website 
lb_min_bandwith_in_mgps = 0
lb_max_bandwith_in_mgps = 0
