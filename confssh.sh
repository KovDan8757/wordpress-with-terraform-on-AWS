#!/bin/bash

# setting ssh config file at /home/$USER/.ssh/config
# source https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts#Jump_Hosts_--_Passing_Through_a_Gateway_or_Two
# usage: run sshconf.sh, set ip addresses accordingly, then you can simply ssh into wp through bastion by running "ssh wp"

echo "Bastion public IP:"
read bastionpublicip
echo "WP private IP:"
read wpprivateip
cat << EOF > /home/$USER/.ssh/config
Host bastion
        HostName $bastionpublicip      
        IdentityFile ~/.ssh/ec2-rsa
        User ubuntu

Host wp
        HostName $wpprivateip
        IdentityFile ~/.ssh/ec2-rsa
        Port 22
        User ubuntu
        ProxyCommand ssh -o StrictHostKeyChecking=accept-new -q -W %h:%p bastion
EOF
ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "$wpprivateip"