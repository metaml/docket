.PHONY: install kafka

DEBIAN_FRONTEND := noninteractive

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

KAFKA_VER = 0.9.0.0
KAFKA_URL = http://apache.mirrors.pair.com/kafka/${KAFKA_VER}/kafka_2.11-${KAFKA_VER}.tgz
OPT ?= /opt

install: kafka

kafka:
	[ -d ${OPT} ] || mkdir -p ${OPT}
	cd ${OPT} && wget --quiet --output-document=- ${KAFKA_URL} | tar xz
	cd ${OPT} && mv -f kafka_2.11-${KAFKA_VER} kafka

