.PHONY: install influxdb chown

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

DEBIAN_FRONTEND := noninteractive

INFLUX_VER = 0.12.1-1
INFLUX_URL = https://s3.amazonaws.com/influxdb/influxdb-${INFLUX_VER}_linux_amd64.tar.gz
install: influxdb chown

OPT ?= /opt
influxdb:
	mkdir -p ${OPT}/influxdb
	cd ${OPT}/influxdb && wget --quiet --output-document=- ${INFLUX_URL} | tar xz
	mkdir -p ${OPT}/influxdb/meta

chown:; chown -R root:root ${OPT}/influxdb
