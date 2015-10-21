#!/bin/bash

ls -al ~/cache

# Install terraform
mkdir -p ~/cache/terraform

cd ~/cache/terraform
wget https://dl.bintray.com/mitchellh/terraform/terraform_0.6.4_linux_amd64.zip
unzip terraform_0.6.4_linux_amd64.zip -d /usr/local/bin
cd ..

ls -al ~/cache
ls -al ~/cache/terraform

#echo $PATH

#export PATH=~/cache/terraform:$PATH

#echo $PATH

#~/cache/terraform/terraform version
which terraform
terraform version