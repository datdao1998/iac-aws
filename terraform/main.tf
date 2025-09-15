module "ec2" {
  source = "./ec2"  # Path to the EC2 module
}

module "ecr" {
  source = "./ecr"  # Path to the ECR module
}

module "lambda" {
  source = "./lambda"   # Path to the Lambda module
  repository_url = module.ecr.repository_url  # Pass the ECR repository URL to the Lambda module
}
