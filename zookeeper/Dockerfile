FROM ubuntu-java:latest
MAINTAINER mlee (mlee@conductor.com)

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y make
RUN mkdir -p /data /log && chown -R daemon /data /log

WORKDIR /opt
RUN mkdir -p mk

ADD zookeeper.mk /opt/mk/zookeeper.mk
RUN make -f mk/zookeeper.mk

ADD myid /data/myid
ADD zoo.cfg /opt/zookeeper/conf/zoo.cfg
ADD start /opt/zookeeper/start

RUN chown -R daemon /opt/zookeeper

USER daemon
WORKDIR /opt/zookeeper
ENTRYPOINT ["/opt/zookeeper/start"]
EXPOSE 2181 2888 3888
