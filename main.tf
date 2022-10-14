variable "name" {
  type        = string
  description = "project name"
}

variable "env" {
  type        = string
  description = "enviroment name, such as dev, staging, prod, etc"
}

variable "callback_urls" {
  type        = list(string)
  description = "replace with your website name with post-fix /oauth2/idpresponse"
  default = [
    "https://www.example.com/oauth2/idpresponse"
  ]
}

module "terraform-aws-cognito-user-pool" {

  # use the exist module, adjust to latest version if it released
  source  = "mineiros-io/cognito-user-pool/aws"
  version = "~> 0.9.2"

  name                             = "${var.name}-${var.env}-userpool"
  domain                           = "${var.name}-${var.env}"
  password_minimum_length          = "8"
  temporary_password_validity_days = "3"

  clients = [
    {
      name                                 = "${var.name}-${var.env}"
      read_attributes                      = ["email", "email_verified", "preferred_username"]
      allowed_oauth_scopes                 = ["email", "openid"]
      allowed_oauth_flows                  = ["code"]
      callback_urls                        = var.callback_urls
      allowed_oauth_flows_user_pool_client = true
      supported_identity_providers         = ["COGNITO"]
      generate_secret                      = true
    }
  ]

}
