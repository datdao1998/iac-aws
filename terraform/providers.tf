terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.31.0"
        }
    }
    backend "s3" {
      bucket = "iac-aws-demo"   # Name of the S3 bucket to store the state file
      key = "terraform/terraform.tfstate" # Store the state file in a specific path within the bucket
      region = "ap-southeast-1" # Specify the AWS region where the S3 bucket is located
    }
}

provider "aws" {
  region = "ap-southeast-1"   # Specify the AWS region to use
}