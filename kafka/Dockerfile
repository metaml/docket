FROM ubuntu-java:latest
MAINTAINER mlee (mlee@conductor.com)

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y make
RUN mkdir -p /data/zookeeper /log/kafka && chown -R daemon /data /log

WORKDIR /opt
RUN mkdir -p mk

ADD kafka.mk /opt/mk/kafka.mk
RUN make -f mk/kafka.mk

ADD server.properties /opt/kafka/config/server.properties
ADD zookeeper.properties /opt/kafka/config/zookeeper.properties

ADD start /opt/kafka/start

RUN chown -R daemon /opt/kafka

USER daemon
WORKDIR /opt/kafka
ENTRYPOINT ["/opt/kafka/start"]
EXPOSE 2181 2888 3888
