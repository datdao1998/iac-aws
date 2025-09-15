# This Terraform configuration creates an AWS ECR repository named "lambda-demo"
resource "aws_ecr_repository" "lambda_repo" {
  name = "lambda-demo"

    lifecycle {
        prevent_destroy = true # Prevent accidental deletion of the repository
    }
}