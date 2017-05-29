
IMAGE=amarillion/alleg4-plus-buildenv
VERSION=4.4.2

build:
	docker build -t ${IMAGE}:${VERSION} .
	docker tag ${IMAGE}:${VERSION} ${IMAGE}:latest

push:
	docker login
	docker push ${IMAGE}
