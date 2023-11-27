
IMAGE=amarillion/alleg5-plus-buildenv
VERSION=5.2.9.0

build:
	docker build -t ${IMAGE}:${VERSION} .
	docker tag ${IMAGE}:${VERSION} ${IMAGE}:latest

push:
	docker login
	docker push ${IMAGE}
	docker push ${IMAGE}:${VERSION}
