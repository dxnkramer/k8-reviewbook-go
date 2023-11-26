VERSION?=v3
REGISTRY?=staging-k8s.gcr.io

release: clean build push clean

# builds a docker image that builds the app and packages it into a minimal docker image
build:
	docker buildx build --load -t ${REGISTRY}/reviewbook:${VERSION} .

# push the image to an registry
push:
	docker buildx build --push -t ${REGISTRY}/reviewbook:${VERSION} .

# remove previous images and containers
clean:
	docker rm -f ${REGISTRY}/reviewbook:${VERSION} 2> /dev/null || true

.PHONY: release clean build push
