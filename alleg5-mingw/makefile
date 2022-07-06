
IMAGE=amarillion/alleg5-buildenv
VERSION=5.2.8.0
SUFFIX=-mingw-w64-i686

build:
	docker build -t ${IMAGE}:${VERSION}${SUFFIX} .
	docker tag ${IMAGE}:${VERSION}${SUFFIX} ${IMAGE}:latest${SUFFIX}

push:
	docker login
	docker push ${IMAGE}:${VERSION}${SUFFIX}
	docker push ${IMAGE}:latest${SUFFIX}

shell:
	docker run -ti ${IMAGE}:latest${SUFFIX} bash