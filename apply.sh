#!/bin/bash -u

WORK_DIR=$(pwd)
TF_ENV=$1   # staging or production

# Create a timestamp for uniquefying stuff
timestamp=`date +"%Y%m%d%H%M%S"`

terraform remote config\
  -backend=s3\
  -backend-config="region=eu-west-1"\
  -backend-config="bucket=tf-states"\
  -backend-config="key=$TF_ENV"\
  -backend-config="encrypt=true"\
  -pull=true

terraform apply\
  -refresh=true\
  -state=${TF_ENV}.out\
  -backup=-\
  -var-file=${TF_ENV}.tfvars\
  -var "aws_access_key=${AWS_ACCESS_KEY_ID}"\
  -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}"\
  -var "timestamp=${timestamp}"\
  "${WORK_DIR}"

