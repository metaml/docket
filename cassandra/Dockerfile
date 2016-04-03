FROM ubuntu:15.10
MAINTAINER ml (metaml@gmail.com)

RUN apt-get install -y make

USER root
WORKDIR /var/tmp

ADD base.mk base.mk
RUN make -f base.mk

ADD java.mk java.mk
RUN make -f java.mk

ADD cassandra.mk cassandra.mk
RUN make -f cassandra.mk

ADD cassandra.yaml /opt/cassandra/conf/cassandra.yaml

ADD start /opt/cassandra/start

WORKDIR /opt/cassandra
USER daemon
ENTRYPOINT ["/opt/cassandra/start"]
EXPOSE 7199 9042 9160
