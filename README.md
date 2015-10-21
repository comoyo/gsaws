# gsaws

Flow:
* Push code to github PR
* Webhook => CI
* CI run plan phase for staging env
* When PR is merged into "master" => push changes to staging (terraform apply to staging own AWS account) [not sure]


State for each environment is saved in s3 bucket:
-------------------------------------------------
TF_ENV=production && terraform remote config -backend=s3 -backend-config="bucket=tf-states" -backend-config="key=$TF_ENV" -backend-config="encrypt=true" -pull=true
TF_ENV=staging && terraform remote config -backend=s3 -backend-config="bucket=tf-states" -backend-config="key=$TF_ENV" -backend-config="encrypt=true" -pull=true


Commands:
---------
./plan.sh staging
./plan.sh production