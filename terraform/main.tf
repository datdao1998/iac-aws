module "ec2" {
  source = "./ec2"
}

module "ecr" {
  source = "./ecr"
}

module "lambda" {
  source = "./lambda"
}