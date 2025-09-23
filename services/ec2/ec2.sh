AWS_REGION=ap-southeast-1
REPO=ansible-demo
IMAGE_TAG=latest

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

# 1) Create (idempotent) ECR repository
aws ecr create-repository --repository-name $REPO >/dev/null 2>&1 || true

# 2) Login Docker to ECR
aws ecr get-login-password --region $AWS_REGION \
| docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# 3) Build for the target architecture
docker build -t $REPO:$IMAGE_TAG .

# 4) Tag & push
docker tag $REPO:$IMAGE_TAG $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO:$IMAGE_TAG
docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO:$IMAGE_TAG
