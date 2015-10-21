#!/bin/bash

ls -al ~/cache

mkdir -p ~/cache

# Install terraform
mkdir terraform
cd terraform
wget https://dl.bintray.com/mitchellh/terraform/terraform_0.6.4_linux_amd64.zip
unzip terraform_0.6.4_linux_amd64.zip
cd ..

ls -al ~/cache
ls -al ~/cache/terraform

#echo $PATH

export PATH=~/cache/terraform:$PATH

echo $PATH

terraform version