.PHONY: default ppa stack

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

DEBIAN_FRONTEND := noninteractive
CODE_NAME := $(shell lsb_release --codename | awk '{print $$NF}')

default: ppa stack

ppa:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442
	echo 'deb http://download.fpcomplete.com/ubuntu ${CODE_NAME} main' | sudo tee /etc/apt/sources.list.d/fpco.list

stack:
	sudo apt-get update -y && sudo apt-get install -y stack
