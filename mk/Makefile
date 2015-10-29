SHELL := /bin/bash
PATH := bin:${PATH}

DATABASE_HOST ?= $(shell docker inspect db | jq '.[0].NetworkSettings.IPAddress' | sed 's/"//g')
DATABASE_DB ?= dev
DATABASE_USER ?= dev
DATABASE_PASSWORD ?= dev
DATABASE_CONNECTIONS ?= 4
DATABASE_TIMEOUT ?= 8

DATABASE_URL ?= postgresql://${DATABASE_USER}:${DATABASE_PASSWORD}@${DATABASE_HOST}/${DATABASE_DB}

DATABASE_ENVS = DATABASE_HOST=${DATABASE_HOST}
DATABASE_ENVS += DATABASE_DB=${DATABASE_DB}
DATABASE_ENVS += DATABASE_USER=${DATABASE_USER}
DATABASE_ENVS += DATABASE_PASSWORD=${DATABASE_PASSWORD}
DATABASE_ENVS += DATABASE_CONNECTIONS=${DATABASE_CONNECTIONS}
DATABASE_ENVS += DATABASE_TIMEOUT=${DATABASE_TIMEOUT}

# db
db:
	cd lib/docker/postgresql && make
	if [ ! -x /usr/bin/psql ]; then \
		sudo apt-get update -y; \
		sudo apt-get install -y postgresql-client; \
	fi
es:; cd lib/docker/elasticsearch && make

# docker
DOCKER_IDS ?= $(shell docker ps --all --quiet)
docker-ps:; docker ps
docker-ls:; docker ps --all
docker-stop:; [ -z "${DOCKER_IDS}" ] || docker stop ${DOCKER_IDS}
docker-clean:; [ -z "${DOCKER_IDS}" ] || docker rm --force ${DOCKER_IDS}
docker-clobber: docker-stop docker-clean
# e.g.: make docker-sh id=d1defa6a9edb
docker-sh:; docker exec --interactive=true --tty=true ${id} /bin/bash

daemon-start:; for i in docker.service docker.socket; do sudo systemctl start $$i; done
daemon-stop:; for i in docker.service docker.socket; do sudo systemctl stop $$i; done
daemon-restart: daemon-stop daemon-start

.PHONY: db es \
	docker-ps docker-ls docker-stop docker-clean docker-clobber docker-sh \
	daemon-start daemon-stop daemon-restart
