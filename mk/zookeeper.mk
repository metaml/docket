.PHONY: install zookeeper

DEBIAN_FRONTEND := noninteractive

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

ZK_VER = 3.4.8
ZK_TAR = http://mirrors.sonic.net/apache/zookeeper/zookeeper-${ZK_VER}/zookeeper-${ZK_VER}.tar.gz
OPT ?= /opt

install: zookeeper iputils-ping

zookeeper:
	[ -d ${OPT} ] || mkdir -p ${OPT}
	cd ${OPT} && wget --quiet --output-document=- ${ZK_TAR} | tar xz
	cd ${OPT} && mv -f zookeeper-${ZK_VER} zookeeper

iputils-ping:
	apt-get install -y iputils-ping
