DOCKER_URL = https://www.docker.com/products/docker-toolbox
OS := $(shell uname -s)

java: ## install java (jdk)
java: java-${OS}

java-Darwin:
	open ${DOCKER_URL}

java-Linux:
	echo to do
