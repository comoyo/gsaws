#!/bin/bash

# Install terraform
mkdir -p ~/cache/terraform
cd ~/cache/terraform

curl --silent -z archive_terraform.zip -o archive_terraform.zip --location -w "Downloaded: %{size_download} bytes (HTTP Code: %{http_code})\n" https://dl.bintray.com/mitchellh/terraform/terraform_0.6.5_linux_amd64.zip

if [ ! -f "terraform" ]; then
  echo "Extracting archive_terraform.zip"
  unzip archive_terraform.zip > /dev/null
else
  echo "archive_terraform.zip is already extracted"
fi

cp terraform* ~/bin/

which terraform
terraform version