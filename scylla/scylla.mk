SHELL = /bin/bash
PATH = /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export DEBIAN_FRONTEND = noninteractive

VER = 1.2-xenial
URL = http://downloads.scylladb.com/deb/ubuntu/scylla-${VER}.list
PPA = /etc/apt/sources.list.d/scylla.list

default: ppa apt-update scylla

scylla:; apt-get install --allow-unauthenticated --yes $@

ppa:; wget -O ${PPA} ${URL}

apt-update:; apt-get update -y

.PHONY: default scylla ppa apt-get
