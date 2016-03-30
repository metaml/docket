.PHONY: install

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
DEBIAN_FRONTEND := noninteractive

install:; apt-get update -y && apt-get install -y jq
