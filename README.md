# gsaws

Flow:
* Push code to github PR
* Webhook => CI
* CI run plan phase for staging env
?* When PR is merged into "master" => push changes to staging (terraform apply to staging own AWS account)


State for each environment is saved in s3 bucket.
terraform remote config -backend=s3 -backend-config="bucket=tf-state-anton" -backend-config="key=anton" -pull=true
