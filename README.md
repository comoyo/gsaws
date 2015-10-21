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
./codeship_setup.sh
./plan.sh staging
./apply.sh staging

Send PR to master:
brew install hub
hub pull-request -m "Added pr tests" -b master

---

Commit pushed => terraform plan compiled and saved to out-file to s3 (update state file on s3 for staging env) =>
terraform apply that s3 file to stage env

To-do:
------
[x] Revised Terraform knowledge
[x] Setup CI/CD
[ ] Build/plan/update on staging AWS account
[ ] Implement basic infrastructure in Terraform