.PHONY: ghc ppa pkg update

SHELL := /bin/bash

default: ppa update pkg ghc symlink

ghc:; sudo apt install --force-yes -y ghc-7.10.2 cabal-install-1.22 alex-3.1.4 happy-1.19.5

symlink:
	sudo ln -s /opt/ghc/7.10.2/bin/* /usr/local/bin/
	sudo ln -s /opt/cabal/1.22/bin/cabal /usr/local/bin/
	sudo ln -s /opt/alex/3.1.4/bin/alex /usr/local/bin/
	sudo ln -s /opt/happy/1.19.5/bin/happy /usr/local/bin/

pkg:; sudo apt install -y $(PKGS)

update:; sudo apt update -y && sudo apt upgrade -y

ppa:
	sudo add-apt-repository ppa:hvr/ghc
	wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
	echo 'deb http://download.fpcomplete.com/ubuntu/vivid stable main' | sudo tee /etc/apt/sources.list.d/fpco.list

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

