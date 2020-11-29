# Deploy compose sample application on Amazon ECS

## ECR

1. Setup Makefile

```
##### PUT_ECR_AWS_ACCOUNT_ID_HERE #####
AWS_ACCOUNT_ID ?=
REGION =
IMAGE =
REPOSITORY_NAME =
#######################################
```

2. Push to Amazon ECR

```
$ make auth
$ make build-image
$ make create-ecr
$ make push-ecr
```

## CircleCI

1. Create IAM User
```
AmazonEC2ContainerRegistryFullAccess
AmazonEC2ContainerServiceFullAccess
```

2. Set Environment Variables

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
AWS_ECR_ACCOUNT_URL
MY_APP_PREFIX
```

Docs.  
[circleci/aws-ecr](https://circleci.com/developer/orbs/orb/circleci/aws-ecr)  
[circleci/aws-ecs](https://circleci.com/developer/orbs/orb/circleci/aws-ecs)  
