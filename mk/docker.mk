.PHONY: default docker docker-compose update ppa

.DEFAULT_GOAL: preamble ppa update docker docker-compose

docker:; apt-get install -y docker-engine

docker-compose:; apt-get install -y docker-compose

update:; apt-get update -y && apt-get upgrade -y

ppa:; add-apt-repository -y ppa:webupd8team/java

CODENAME := $(shell lsb_release --codename | awk '{print $$NF}')
preamble:
	apt-get update -y
	apt-get install -y apt-transport-https ca-certificates
	apt-key adv \
		--keyserver hkp://p80.pool.sks-keyservers.net:80 \
		--recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	# @todo: may want to ask for yay/nay before proceeding
	echo deb https://apt.dockerproject.org/repo ubuntu-${CODENAME} main \
	| tee /etc/apt/sources.list.d/docker.list
	apt-get update -y
	apt-get install -y linux-image-extra-$$(uname -r)

docker-group:
	[ -z "$$LOGNAME" ] || usermod -aG docker $$LOGNAME
