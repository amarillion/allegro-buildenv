
IMAGE=amarillion/alleg5-buildenv
VERSION=5.2.8.0
SUFFIX=-linux

build:
	docker build -t ${IMAGE}:${VERSION}${SUFFIX} .
	docker tag ${IMAGE}:${VERSION}${SUFFIX} ${IMAGE}

push:
	docker login
	docker push ${IMAGE}
