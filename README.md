# Secure AWS API Gateway With Cognito User Pool

There are a lot of tutorial on how to setup authenticate users with Cognito user pool using AWS ALB, the setup is not straightforward. 

With this terraform codes in this repo, you can setup a cognito user pool with an app client directly. It has been adjusted for ALB (AWS Application Load Balancer).

After that, you can understand how cognito integrates with ALB, and do some adjustments easily if you want to.

### Steps

1. Deploy Cognito with terraform

```
# make sure you have set AWS CLI config to the proper aws account
# use this command to confirm
aws s3 ls

# do adjustment for your project in file `staging.tfvars` or create your own
# dry-run
terraform init
terraform plan -var-file=staging.tfvars

# if everything looks fine, uncomment below line
# terraform apply -var-file=staging.tfvars
```

It will deploy the cognito user pool in your account in default region you set

2. create users in cognito

Create users in cognito is easy, jump to the new created cognito user pool, go to users and create one

![create cognito user](images/create-user.png)

3. integrate cognito into ALB

edit rules in ALB, add new authenticate using Cognito, choice the cognito id and app client id

![Integrate cognito with ABL](images/alb.png)

4. test

now if you access your website, it will ask for username and password

![login page](images/login.png)

### cost of cognito

cognito user pool is less cost, nearly free

https://aws.amazon.com/cognito/pricing/
 
### Reference

https://docs.aws.amazon.com/elasticloadbalancing/latest/application/listener-authenticate-users.html

