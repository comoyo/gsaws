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

Send PR to master:
brew install hub
hub pull-request -m "Added pr tests" -b master

---

Commit pushed => terraform plan compiled and saved to out-file to s3 (update state file on s3 for staging env) =>
terraform apply that s3 file to stage env


---
Installed go.cd - http://127.0.0.1:8153/ - nice toy, but not for now:
http://www.go.cd/2015/08/05/Go-Sample-Virtualbox.html
vagrant ssh
cd /var/lib/go-server/plugins/external/
sudo curl -OL https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/v1.2.3/github-pr-poller-1.2.3.jar
sudo curl -OL https://github.com/gocd-contrib/gocd-build-status-notifier/releases/download/1.1/github-pr-status-1.1.jar
sudo service go-server restart

To-do:
------
[x] Revised Terraform knowledge
[ ] Setup CI/CD
[ ] Build/plan/update on staging AWS account
[ ] Implement basic infrastructure in Terraform