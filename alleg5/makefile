
IMAGE=amarillion/alleg5-buildenv
VERSION=5.2.10.1
SUFFIX=-linux

build:
	docker build -t ${IMAGE}:${VERSION}${SUFFIX} .
	docker tag ${IMAGE}:${VERSION}${SUFFIX} ${IMAGE}

push:
	docker login
	docker push ${IMAGE}
	docker push ${IMAGE}:${VERSION}${SUFFIX}

shell:
	docker run -ti ${IMAGE}:${VERSION}${SUFFIX}
