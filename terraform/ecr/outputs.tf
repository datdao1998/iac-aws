output "repository_url" {
  description = "The URL of the ECR repository" # Output the ECR repository URL
  value       = aws_ecr_repository.lambda_repo.repository_url # Reference the repository URL from the ECR resource
}