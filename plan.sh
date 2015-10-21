#!/bin/bash -eux

WORK_DIR=$(pwd)
TF_ENV=$1   # staging or production

terraform remote config\
  -backend=s3\
  -backend-config="bucket=tf-states"\
  -backend-config="key=$TF_ENV"\
  -backend-config="encrypt=true"\
  -pull=true

# Start the provisioning process
#terraform apply\
#terraform refresh\
terraform plan\
  -refresh=true\
  -state=${TF_ENV}.tfstate\
  -backup=-\
  -var-file=${TF_ENV}.tfvars\
  -var "aws_access_key=${AWS_ACCESS_KEY_ID}"\
  -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}"\
  -out=.terraform/${TF_ENV}.out\
  "${WORK_DIR}"