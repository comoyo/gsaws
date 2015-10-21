#!/bin/bash

ls -al ~/cache

mkdir -p ~/cache

# Install terraform
mkdir terraform
cd terraform
wget https://dl.bintray.com/mitchellh/terraform/terraform_0.6.4_linux_amd64.zip
unzip terraform_0.6.4_linux_amd64.zip

export PATH=~/cache/terraform:$PATH

#echo $PATH