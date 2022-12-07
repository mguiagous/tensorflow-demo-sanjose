# This is the only file to be maintained
#
# Number of servers
sever_count = 2
#
# Compartement OCID
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaa6gcfbr325xdlw7j6dbko6psl3itjnjsohlk3zaoshxx4szo533fq"
#
# "ocid1.image.oc1.us-sanjose-1.aaaaaaaanypljfcdl4wj7wfqcfradpzgzazdbvpntl36zk3bcktoqyzcf4ma"
image_ocid = "ocid1.image.oc1.us-sanjose-1.aaaaaaaacxrlqz7bdlqobvtfxnrlz7f77wai4k4v6exvpcsfpift6qhctkfq"
#
# Display Name Prefix
display_name_prefix = "1-Click-Demo-LandoTech"
#
# Public ssh key path
ssh_public_key = "/home/mail2maham/.ssh/cloudshellkey.pub"
#
# Private ssh key path
ssh_private_key = "/home/mail2maham/.ssh/cloudshellkey"
#
# Assigned Public IP
assign_public_ipaddress = true
#
# Subnet OCID (DemoVCN)
subnet_ocid = "ocid1.subnet.oc1.us-sanjose-1.aaaaaaaapr5doacqwanrxm5a6chbs5edp4wyhvyzrbkgfihhg4j3zzllezqq"
#
network_security_group_id = "ocid1.networksecuritygroup.oc1.us-sanjose-1.aaaaaaaahyoqp3amlruufbrignos5z5fhfmevttboptoiub6yxmfutwd4r6q"
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
lb_min_bandwith_in_mgps = 10
lb_max_bandwith_in_mgps = 10
