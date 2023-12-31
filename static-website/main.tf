terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  backend "s3" {
    bucket         = "mira-terraform-project-tf-state"
    key            = "static-website/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "static_website_1" {
  source = "../static-website-module"
  name   = "static-website-1"
  # Input Variables
  bucket_prefix = "www.mira-static-website.com" #must be the same as domain name
  domain_name   = "www.mira-static-website.com"
  directory_name = "rockPaperScissors" #same as the directory with the files you
}
