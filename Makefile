.PHONY: build run

COMMIT := $(shell git describe --dirty --always)
DOCKER_IMAGE := plippe/tensorflow-bottleneck-web-service:${COMMIT}

build:
	docker build -t ${DOCKER_IMAGE} .

run: build
	docker run \
		--rm \
		--tty \
		--interactive \
		--volume ${PWD}:/opt/tensorflow-bottleneck-web-service \
		${DOCKER_IMAGE}
