#!/bin/bash
. .build.env

build(){
	docker build -t oogy/${IMAGE_NAME}:${IMAGE_TAG} . --build-arg GO_VERSION=${GO_VERSION} --build-arg GO_URL=${GO_URL} --build-arg PACKER_VERSION=${PACKER_VERSION} --build-arg PACKER_URL=${PACKER_URL} --build-arg PACKER_BUILDER_VULTR_VERSION=${PACKER_BUILDER_VULTR_VERSION} --build-arg PACKER_BUILDER_VULTR_URL=${PACKER_BUILDER_VULTR_URL}
}

push_to_dockerhub(){
	docker push oogy/${IMAGE_NAME}:${IMAGE_TAG}
}

main(){
	build
	push_to_dockerhub
}

main
