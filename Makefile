##### PUT_ECR_AWS_ACCOUNT_ID_HERE #####
AWS_ACCOUNT_ID ?=
REGION =
IMAGE =
REPOSITORY_NAME =
#######################################
DOCKER_PUSH_REPOSITORY = dkr.ecr.$(REGION).amazonaws.com


auth:
	aws ecr get-login-password --region $(REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).$(DOCKER_PUSH_REPOSITORY)

build-image:
	docker build -t $(AWS_ACCOUNT_ID).$(DOCKER_PUSH_REPOSITORY)/$(IMAGE) ./app

create-ecr:
	aws ecr create-repository \
			--repository-name ${REPOSITORY_NAME} \
			--image-scanning-configuration scanOnPush=true \
			--region ap-northeast-1

push-ecr:
	docker push $(AWS_ACCOUNT_ID).$(DOCKER_PUSH_REPOSITORY)/$(IMAGE)

clean:
	@docker context use default
	@docker-compose rm -f || true
