REPO           ?= authexec/aesm-client
TAG            ?= latest
VOLUME         ?= $(shell pwd)

PORT           ?= 13741

run:
	docker run --rm --detach --network=host -v /var/run/aesmd/:/var/run/aesmd --env AESM_PORT=$(PORT) --name aesm-client $(REPO):$(TAG)

pull:
	docker pull $(REPO):$(TAG)

build:
	docker build -t $(REPO):$(TAG) .

push: login
	docker push $(REPO):$(TAG)

shell:
	docker run --rm -it $(REPO):$(TAG) bash

login:
	docker login