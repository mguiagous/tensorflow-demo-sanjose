
#!/usr/bin/bash

echo -e "\n Checking to see if the inventory file /home/mail2maham/demo1/ansible/tf_inventory.yaml exisits"

if [ -f "/home/mail2maham/demo1/ansible/tf_inventory.yaml" ]; 
then
    echo -e "\n Found /home/mail2maham/demo1/ansible/tf_inventory.yaml, it will be deleted"
    rm /home/mail2maham/demo1/ansible/tf_inventory.yaml
    echo -e "\n Checking to verify that it is deleted ..... "
    pwd
    ls -ltr
fi
echo -e "\n Creating the /home/mail2maham/demo1/ansible/tf_inventory.yaml now ...." 
touch /home/mail2maham/demo1/ansible/tf_inventory.yaml
echo -e "[servers]" > /home/mail2maham/demo1/ansible/tf_inventory.yaml
pwd
ls -ltr

cat /home/mail2maham/demo1/ansible/tf_inventory.yaml
