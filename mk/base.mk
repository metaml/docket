SHELL = /bin/bash
DEBIAN_FRONTEND = noninteractive

PKGS = software-properties-common make patch apt-utils sudo wget curl unzip

default:
	locale-gen en_US en_US.UTF-8
	dpkg-reconfigure locales && update-locale LC_ALL="en_US.UTF-8"
	apt-get install -y $(PKGS)
	apt-get update -y && apt-get upgrade -y
	mkdir -p /data /log && chown -R daemon /data /log
