.PHONY: docker

IMAGE = elasticsearch

docker: base.mk ${IMAGE}.mk
	docker build --tag=${IMAGE} .

%.mk: ../mk/%.make
	ln -f $< $@

DOCKER_IMAGE = ${IMAGE}
include ../mk/docker.mk
