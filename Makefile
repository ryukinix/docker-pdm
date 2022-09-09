DOCKER_REGISTRY := ryukinix/pdm
VERSION := latest

build:
	docker build -t $(DOCKER_REGISTRY) .

publish:
	docker tag $(DOCKER_REGISTRY) $(DOCKER_REGISTRY):$(VERSION)
	docker push $(DOCKER_REGISTRY):$(VERSION)
