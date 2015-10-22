# Hackathon project: Global Scale AWS infrastructure as code (testable and continuously evolving)

Check wiki for more details - https://github.com/comoyo/gsaws/wiki

To-do:
------
[x] Revised Terraform knowledge
[x] Setup CI/CD
[x] Build/plan/update on staging AWS account
[x] Implement basic infrastructure in Terraform
[ ] Deploy simple nginx homepage

State for each environment is saved in s3 bucket:
-------------------------------------------------
TF_ENV=production && terraform remote config -backend=s3 -backend-config="bucket=tf-states" -backend-config="key=$TF_ENV" -backend-config="encrypt=true" -pull=true

TF_ENV=staging && terraform remote config -backend=s3 -backend-config="bucket=tf-states" -backend-config="key=$TF_ENV" -backend-config="encrypt=true" -pull=true


Commands:
---------
./codeship_setup.sh
./plan.sh staging
./apply.sh staging


Helpers:
--------
Send PR to master (first install it - `brew install hub`):
hub pull-request -m "Added pr tests" -b master
