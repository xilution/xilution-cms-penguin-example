include ./config.mk

build:
	@make docker-build

docker-build:
	@docker build -t xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME) .

docker-create-repository-test:
	@aws ecr create-repository --repository-name xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME) --profile xilution-test

docker-create-repository-prod:
	@aws ecr create-repository --repository-name xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME) --profile xilution-prod

docker-publish-test:
	@aws ecr get-login --no-include-email --profile xilution-test | /bin/bash
	@docker tag xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME) $(AWS_TEST_ACCOUNT).dkr.ecr.$(AWS_REGION).amazonaws.com/xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME):$(IMAGE_VERSION)
	@docker push $(AWS_TEST_ACCOUNT).dkr.ecr.$(AWS_REGION).amazonaws.com/xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME)

docker-publish-prod:
	@aws ecr get-login --no-include-email --profile xilution-prod | /bin/bash
	@docker tag xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME) $(AWS_PROD_ACCOUNT).dkr.ecr.$(AWS_REGION).amazonaws.com/xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME):$(IMAGE_VERSION)
	@docker push $(AWS_PROD_ACCOUNT).dkr.ecr.$(AWS_REGION).amazonaws.com/xilution/$(XILUTION_ORGANIZATION_ID)/$(IMAGE_NAME)

start:
	docker-compose up --build -d

stop:
	docker-compose down

clean:
	rm -rf database html

open:
	open http://localhost:8000
