.PHONY: elasticsearch marvel daemon-owner

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

DEBIAN_FRONTEND := noninteractive

ES_VER = 1.7.3
ES_SRC = https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${ES_VER}.tar.gz

default: elasticsearch marvel daemon-owner

elasticsearch:
	mkdir -p /opt
	cd /opt && wget --quiet --output-document=- ${ES_SRC} | tar xz
	cd /opt && mv -f elasticsearch-${ES_VER} elasticsearch

marvel:; cd /opt/elasticsearch && ./bin/plugin -i elasticsearch/marvel/latest

daemon-owner:; chown -R daemon:daemon /opt/elasticsearch/config
