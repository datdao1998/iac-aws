# Description
Guildine for deploying infrastructure to cloud environment using IaC tools

# Installation (in MacOS)
 ## Terraform
 1. Install via brew

    ```
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
    ```

2. Check version
    ```
    terraform version
    ```

3. Export AWS Credentials

    ```
        export AWS_ACCESS_KEY_ID=<your-aws-access-key-id>
        export AWS_SECRET_ACCESS_KEY=<your-aws-secret-key>
        export AWS_REGION=<your-aws-region>
    ```

4. Build and push image to ECR
    ```
        cd services
        sh ecr.sh
    ```

5. Apply Terraform
    ```
        cd terraform
        terraform init
        terraform apply
    ```

6. Test Lambda Service
    ```
        aws lambda invoke --function-name lambda-demo --cli-binary-format raw-in-base64-out --payload file://input.json output.json
    ```

7. Destroy infa
    ```
        terraform destroy
    ```

# Next Step 
Integrate with Jenkins/Github Actions for CI/CD
    