.PHONY: default haproxy sed

SHELL := /bin/bash
PATH := /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

DEBIAN_FRONTEND := noninteractive

defaul: haproxy sed

haproxy:; apt-get install -y haproxy

sed:; sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy
