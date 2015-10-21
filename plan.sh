#!/bin/bash -u

WORK_DIR=$(pwd)
TF_ENV=$1   # staging or production

terraform remote config\
  -backend=s3\
  -backend-config="region=eu-west-1"\
  -backend-config="bucket=tf-states"\
  -backend-config="key=$TF_ENV"\
  -backend-config="encrypt=true"\
  -pull=true

terraform plan\
  -refresh=true\
  -state=${TF_ENV}.tfstate\
  -backup=-\
  -detailed-exitcode\
  -var-file=${TF_ENV}.tfvars\
  -var "aws_access_key=${AWS_ACCESS_KEY_ID}"\
  -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}"\
  -out=.terraform/${TF_ENV}.out\
  "${WORK_DIR}"

EXIT_CODE=$?

if [ $EXIT_CODE == 0 ]; then
  echo "There is nothing to change. Diff is empty."
  exit 0
elif [ $EXIT_CODE == 2 ]; then
  echo "There are changes, so we should apply this changes to staging!!!"
  exit 0
else
  echo "ERRRRRRROR during plan"
  exit 1
fi
