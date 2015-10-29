FROM ubuntu:15.04
MAINTAINER ml (metaml@gmail.com)

RUN apt-get install -y make

USER root
WORKDIR /var/tmp

ADD base.mk base.mk
RUN make -f base.mk

ADD java.mk java.mk
RUN make -f java.mk

ADD elasticsearch.mk elasticsearch.mk
RUN make -f elasticsearch.mk

ADD elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

ADD start /opt/elasticsearch/bin/start

WORKDIR /opt/elasticsearch
USER daemon
ENTRYPOINT ["/opt/elasticsearch/bin/start"]
