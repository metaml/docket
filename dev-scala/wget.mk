.PHONY: default

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
DEBIAN_FRONTEND := noninteractive

default:; apt-get update -y && apt-get install -y wget
