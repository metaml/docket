.PHONY: default docker docker-compose update ppa

.DEFAULT_GOAL: prologue ppa update docker docker-compose epilogue

docker:; apt-get install -y docker-engine

docker-compose:; apt-get install -y docker-compose

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
	[ -z "$$LOGNAME" ] || usermod -aG docker $$LOGNAME
