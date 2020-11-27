# Deploy compose sample application on Amazon ECS

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

3. Update docker-compose.yml
```
image: <<< your ecr registry >>>
```

4. Deploy to Amazon ECS

```
$ docker context use ***
$ docker compose up
```

Docs.
[circleci/aws-ecr](https://circleci.com/developer/orbs/orb/circleci/aws-ecr)
[circleci/aws-ecs](https://circleci.com/developer/orbs/orb/circleci/aws-ecs)
