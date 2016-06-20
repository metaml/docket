FROM ubuntu-java:latest
MAINTAINER ml (metaml@gmail.com)

RUN apt-get update -y && apt-get install -y make

USER root
WORKDIR /var/tmp

ADD cassandra.mk cassandra.mk
RUN make -f cassandra.mk

ADD cassandra.yaml /opt/cassandra/conf/cassandra.yaml

ADD start /opt/cassandra/start

WORKDIR /opt/cassandra
USER daemon
ENTRYPOINT ["/opt/cassandra/start"]
EXPOSE 7199 9042 9160
