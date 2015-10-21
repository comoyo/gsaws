#!/bin/bash -eux

WORK_DIR=$(pwd)

# Start the provisioning process
#terraform apply\
#terraform refresh\
terraform plan\
  -var-file=production.tfvars\
  -var "aws_access_key=${AWS_ACCESS_KEY_ID}"\
  -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}"\
  "${WORK_DIR}"