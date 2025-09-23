# Terraform configuration for deploying an AWS Lambda function using a Docker image from ECR
resource "aws_lambda_function" "lambda_function" {
    function_name = "lambda-demo"
    package_type = "Image"
    image_uri = "${var.repository_url}:latest"
    role = aws_iam_role.lambda_execution_role.arn
}

# IAM role for Lambda execution
resource "aws_iam_role" "lambda_execution_role" {
    name = "lambda_execution_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    })
}

# Attach the AWSLambdaBasicExecutionRole policy to the Lambda execution role
resource "aws_iam_role_policy_attachment" "lambda_execution_policy" {
    role = aws_iam_role.lambda_execution_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}