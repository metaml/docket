FROM ubuntu-java:latest
MAINTAINER ml (metaml@gmail.com)

RUN apt-get update -y && apt-get install -y make

USER root
RUN mkdir -p /opt/mk
WORKDIR /opt/mk

ADD cassandra.mk cassandra.mk
RUN make -f cassandra.mk

ADD cassandra.yaml /opt/cassandra/conf/cassandra.yaml
ADD start /opt/cassandra/start

RUN mkdir -p /opt/cassandra/logs
RUN chown -R daemon:daemon /opt/cassandra

WORKDIR /opt/cassandra
USER daemon
ENTRYPOINT ["/opt/cassandra/start"]
EXPOSE 7199 9042 9160
