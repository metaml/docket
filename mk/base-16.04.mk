SHELL = /bin/bash
DEBIAN_FRONTEND = noninteractive

PKGS = apt-utils syslinux-common software-properties-common python-software-properties make patch sudo wget curl unzip

default: apt-update base clean apt-update

base:
	apt-get install -y locales \
	&& dpkg-reconfigure -f noninteractive locales \
	&& echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen
	echo "UTC" > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata
	apt-get install -y $(PKGS)
	mkdir -p /data /log && chown -R daemon /data /log

clean:
	apt-get clean \
	&& apt-get autoclean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/cache/* \
	&& rm -rf /var/lib/log/*

apt-update:; apt-get update -y && apt-get upgrade -y
