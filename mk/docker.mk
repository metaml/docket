CIDS := $(shell docker ps --quiet --all --filter 'image=${DOCKER_IMAGE}' | awk '{print $$1}')

start:
	if [ -z "${DEBUG}" ]; then \
                docker run --detach ${DOCKER_IMAGE}; \
        else \
                docker run -it --user=root --entrypoint=/bin/bash ${DOCKER_IMAGE}; \
        fi

stop:; for i in $(CIDS); do docker stop $$i; done

ls:; docker ps --all

clean:; for i in $(CIDS); do docker rm $$i; done

docker-start:
	sudo systemctl unmask docker.socket
	sudo systemctl start docker.socket
	sudo systemctl unmask docker.service
	sudo systemctl start docker.service

docker-stop:
	sudo systemctl stop docker.socket
	sudo systemctl stop docker.service

cid:; echo $(CIDS)
