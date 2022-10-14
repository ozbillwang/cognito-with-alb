# integrate-cognito-with-ALB
Integrate AWS Cognito user pool with AWS ALB (application load balancer)

This script is used for testing purpose and save the terraform state file locally

For real project, remember to set s3 bucket as backend.

```
# make sure you have set AWS CLI config to the proper account
# use this command to confirm
aws s3 ls

# dry-run
terraform init
terraform plan -var-file=staging.tfvars

# if everything looks fine, uncomment below line
# terraform apply -var-file=staging.tfvars

```
