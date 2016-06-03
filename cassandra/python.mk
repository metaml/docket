.PHONY: default java update ppa

install: update python

python:; apt-get install -y python

update:; apt-get update -y && apt-get upgrade -y
