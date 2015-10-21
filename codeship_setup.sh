#!/bin/bash

# Install terraform
mkdir -p ~/cache/terraform
cd ~/cache/terraform
wget https://dl.bintray.com/mitchellh/terraform/terraform_0.6.4_linux_amd64.zip
unzip terraform_0.6.4_linux_amd64.zip -d ~/bin

which terraform
terraform version