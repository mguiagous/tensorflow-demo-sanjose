# This is the main configuration file to maintain
# Update with your own data

########################################
# STEP 0 ===> CREATE A NEW COMPARTMENT #
########################################
#
# Root or Parent Compartement OCID
compartment_ocid              = "ocid1.compartment.oc1..aaaaaaaao"
compartment_name              = "Demo-1AD-Compartment"
compartment_description       = "Demo Child Single AD Compartment"
compartment_delete_on_destroy = true

###################################
# STEP 1 ===> CREATE CORE NETWORK #
###################################

# Core Network - Load Balancer not included
#
# Exisiting Subnet & NSG OCIDs(DemoVCN)
subnet_ocid = "ocid1.subnet.oc1.us-sanjose-1.aaaa....."
network_security_group_id = "ocid1.networksecuritygroup.oc1.us-sanjose-1.aaaaaaaah....."
#
# New VCN & Subnet CIDR Blocks
vcn_cidr_block = "10.0.0.0/16"
subnet_cidr_block = "10.0.1.0/24"

###################################
# STEP 2 ===> CREATE 2 SERVERS/VM #
###################################
#
# Number of Servers (Virtual Machines)
sever_count = 0
#
# Avaialability Domain and fault domain number
availability_domain = "XxXX:US-ASHBURN-AD-1"
fault_domain_number = 0
#
image_ocid = "ocid1.image.oc1.iad.aaaaaaaa......"
#
# Display Name Prefix and host/dns name prefix
display_name_prefix = "One Click Lando Tech"
host_name_prefix = "onecliclt"
#
# Public ssh key path
ssh_public_key = "~/.ssh/cloudshellkey.pub"
#
# Private ssh key path
ssh_private_key = "~/.ssh/cloudshellkey"
#
# Assigned Public IP
assign_public_ipaddress = true


###########################################################
# STEP 3 ===> INSTALL LB & POINT TO THE 2 VMs/Web Servers #
###########################################################
# 
# Flag to configure a felxible load balancer and parameters values 
is_loadbalancer_installed = false
lb_min_bandwith_in_mgps = 10
lb_max_bandwith_in_mgps = 10


###################################
# STEP 4 ===> TEST SSH TO SERVERS #
###################################
#
# Flag to turn on ssh access and configuraiton check
is_testing_required = false


###################################################
# STEP 5 ===> INSTALL APPACHE & CONFIGURE WEB APP #
###################################################
#
# Flag to configure an appache web server and a demo website 
is_website_installed = false


##################################################
# STEP 6 ===> CHECK THE LB HEALTH STATE IS GREEN #
##################################################
#
# Check the web application demo website 
# Run curl http://public_ip_address_of_load_balacer

################################################
# STEP 7 ===> WHEN DONE DESTROY ALL RESSOURCES #
################################################
