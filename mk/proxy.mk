.PHONY: default ppa stack

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

DEBIAN_FRONTEND := noninteractive
CODE_NAME := $(shell lsb_release --codename | awk '{print $$NF}')

proxy: ppa stack build install

install:
	mkdir -p /opt/proxy/bin
	cp /var/tmp/proxy/bin/proxy /opt/proxy/bin

build:
	cd /var/tmp && git clone https://github.com/metaml/proxy
	cd /var/tmp/proxy && stack setup
	cd /var/tmp/proxy && make build

ppa:
	 apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442
	echo 'deb http://download.fpcomplete.com/ubuntu ${CODE_NAME} main' | sudo tee /etc/apt/sources.list.d/fpco.list

stack:
	apt-get update -y && sudo apt-get install -y stack
