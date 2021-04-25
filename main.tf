terraform {
  required_version = ">=0.13"
  required_providers {
      aws = {
          source="hashicorp/aws"
          version="~>3.0"
      }
  }
  #backend "s3" {
  #  bucket         = "ab_terraform_statefile"
  #  key            = "terraform.tfstate"
  #  region         = "ap-south-1"
  #  dynamodb_table = "aws-locks"
  #  encrypt        = true
  #}
}

# configure the aws provider    
provider "aws" {
    region = "ap-south-1"
}

# calling module
module "bootstrap" {
    source = "./modules/bootstrap"
    name_of_s3_bucket="ab_terraform_statefile"
}
