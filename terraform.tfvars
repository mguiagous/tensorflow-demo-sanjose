# This is the only file to be maintained
# This is the only file to be maintained
#
# Number of servers
sever_count = 2
#
# Compartement OCID
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaabliehdjgxojzrpisiode2ujuird3zgn5edvaitsn6x4aolvntsia"
#
# Availability Domain and Fault Domain Name
availability_domain = "GqIF:US-ASHBURN-AD-1"
#
# "ocid1.image.oc1........"
image_ocid = "ocid1.image.oc1.iad.aaaaaaaak6w63p4ddsxlh2hgqh2vycoivsdevwy2utwsqjxwcvsj4vfstlqa"
#
# Display Name Prefix
display_name_prefix = "1-Click-LandoAIML"
#
# hostname
# instance_hostname_label = "1-click-landoaiml-demo"
#
# Public ssh key path
ssh_public_key = "/Users/mguiagou/.jenkins/cloudshellkey.pub"
#
# Private ssh key path
ssh_private_key = "/Users/mguiagou/.jenkins/cloudshellkey"
#
#instance_shape memory and number of CPU
instance_shape         = "VM.GPU2.1"
instance_memory_in_gbs = "72"
instance_nb_of_ocpus   = "12"
#
# Assigned Public IP
assign_public_ipaddress = true
#
# Subnet OCID (DemoVCN)
subnet_ocid = "ocid1.subnet.oc1.iad.aaaaaaaa3xkqo475apqw2gb5gsxrrjopof3x2lka3nqhia7al2yxsv4lb7aa"
#
network_security_group_id = "ocid1.networksecuritygroup.oc1.iad.aaaaaaaa5ew5x7qeu6adutpjeu5kaafsihf7xj4mpwqikhnw2tbn746thnda"
#
# Flag to turn on ssh access and configuraiton check
is_testing_required = true
#
# Flag to configure an appache web server and a demo website 
is_website_installed = false
#
# Flag to configure a felxible load balancer and key parameters for the demo high availabilit scenario 
is_loadbalancer_installed = true
lb_min_bandwith_in_mgps   = 10
lb_max_bandwith_in_mgps   = 10
