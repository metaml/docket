.PHONY: docker start

docker: base.mk postgresql.mk
	docker build --tag=postgresql .

%.mk : ../mk/%.make
	ln -f $< $@

DOCKER_IMAGE = postgresql
include ../mk/docker.mk
