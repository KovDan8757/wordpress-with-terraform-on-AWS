#!/bin/bash

# this script generates keys according to aws standards, they will be used my terraform as aws_key_pair.key-dev-master
date=$(date)
echo "y" | ssh-keygen -f ~/.ssh/ec2-rsa -b 4096 -m PEM -C "ssh key for ec2 - generated on $date" -q -P "" &&
echo "info: ssh keys are done and placed into ~/.ssh/"
