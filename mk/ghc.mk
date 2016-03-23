.PHONY: ghc ppa pkg update stack

#######
# sudo apt-get install -y software-properties-common
# sudo apt-get update
# sudo apt-get install -y cabal-install-1.22 ghc-7.10.3
#######

SHELL := /bin/bash
CODE_NAME := $(shell lsb_release --codename | awk '{print $$NF}')

default: ppa pkg ghc

ghc:; sudo apt-get install -y cabal-install-1.22 ghc-7.10.3 alex happy

pkg:; sudo apt install -y $(PKGS)

ppa:
	sudo add-apt-repository -y ppa:hvr/ghc
	wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
	echo 'deb http://download.fpcomplete.com/ubuntu/${CODE_NAME} stable main' | sudo tee /etc/apt/sources.list.d/fpco.list
	sudo apt-get update -y

PKGS = libgmp-dev libncurses5-dev gcc g++ python-pygments wget zlib1g-dev
PKGS += $(LIBS)

LIBS = libgconf2-4
LIBS +=	libgconf2-dev
LIBS += libnss3-dev
LIBS += libnss3-1d
LIBS += libnss3-tools
LIBS += libudev-dev
LIBS += libxss-dev
LIBS += libxss-dev
LIBS += libxml2-dev
LIBS += libncurses-dev
LIBS += libgpm-dev
LIBS += libgmp10-dev
LIBS += libgmp10
LIBS += libmpfr-dev
LIBS += libmpc-dev
LIBS += libisl-dev
LIBS += libcloog-isl-dev
