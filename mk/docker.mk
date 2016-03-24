.PHONY: default docker docker-compose update ppa

.DEFAULT_GOAL: preamble ppa update docker docker-compose

docker:; sudo apt-get install -y docker-engine

docker-compose:; sudo apt-get install -y docker-compose

update:; apt-get update -y && apt-get upgrade -y

ppa:; add-apt-repository -y ppa:webupd8team/java

CODENAME := $(shell lsb_release --codename | awk '{print $$NF}')
preamble:
	sudo apt-get update -y
	sudo apt-get install -y apt-transport-https ca-certificates
	sudo apt-key adv \
		--keyserver hkp://p80.pool.sks-keyservers.net:80 \
		--recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	# @todo: may want to ask for yay/nay before proceeding
	echo deb https://apt.dockerproject.org/repo ubuntu-${CODENAME} main \
	| sudo tee /etc/apt/sources.list.d/docker.list
	sudo apt-get update -y
	sudo apt-get install -y linux-image-extra-$$(uname -r)

codename:; echo ${CODENAME}
