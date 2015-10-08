FROM ubuntu:15.04
MAINTAINER ml (metaml@gmail.com)

RUN apt-get install -y make

WORKDIR /var/tmp

ADD base.mk base.mk
RUN make -f base.mk

ADD ghc.mk ghc.mk
RUN make -f ghc.mk

USER root
CMD sleep infinity

