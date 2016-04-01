.PHONY: docker docker-enginer docker-compose docker-group update ppa prologue epiplogue

.DEFAULT_GOAL: prologue ppa update docker epilogue

docker: docker-enginer docker-compose

docker-engine:; apt-get install -y docker-engine

docker-compose:
	[ -f /usr/local/bin/docker-compose ] \
	  || curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` \
	  	> /usr/local/bin/docker-compose
	chmod a+x /usr/local/bin/docker-compose

update:; apt-get update -y && apt-get upgrade -y

ppa:; add-apt-repository -y ppa:webupd8team/java

CODENAME := $(shell lsb_release --codename | awk '{print $$NF}')
prologue:
	apt-get update -y
	apt-get install -y apt-transport-https ca-certificates
	apt-key adv \
		--keyserver hkp://p80.pool.sks-keyservers.net:80 \
		--recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	echo deb https://apt.dockerproject.org/repo ubuntu-${CODENAME} main \
	| tee /etc/apt/sources.list.d/docker.list
	apt-get update -y
	apt-get install -y linux-image-extra-$$(uname -r)

epilogue:
	@echo "- [make -f docker.mk docker-group] to creates docker group"
	@echo "  and adds your username to said group"
	@echo "- add [\"GRUB_CMDLINE_LINUX=\"cgroup_enable=memory swapaccount=1\"]"
	@echo "  to /etc/default/grub"

docker-group:
	@if [ -n "$$USERNAME" ]; then \
		usermod -aG docker $$USERNAME; \
	else \
		@echo "USERNAME is empty"; \
	fi
