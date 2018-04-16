IMAGE_TAG := kenorb/dev-env-linux
.PHONY: build push
build:
	docker build -t $(IMAGE_TAG) .
push:
	docker push $(IMAGE_TAG)
