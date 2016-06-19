.PHONY: install cassandra chown

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

DEBIAN_FRONTEND := noninteractive

CASS_VER = 3.7
CASS_URL = http://apache.claz.org/cassandra/${CASS_VER}/apache-cassandra-${CASS_VER}-bin.tar.gz
install: cassandra chown

OPT ?= /opt
cassandra:
	mkdir -p ${OPT}
	cd ${OPT} && wget --quiet --output-document=- ${CASS_URL} | tar xz
	cd ${OPT} && mv -f apache-cassandra-${CASS_VER} cassandra

chown:; chown -R root:root ${OPT}/cassandra
