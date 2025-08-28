terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.31.0"
        }
    }
    backend "s3" {
      bucket = "iac-aws-demo"
      key = "terraform/terraform.tfstate"
      region = "ap-southeast-1"
    }
}

provider "aws" {
  region = "ap-southeast-1"
}