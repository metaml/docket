FROM ubuntu:15.10
MAINTAINER mlee (mlee@conductor.com)

ENV DEBIAN_FRONTEND noninteractive  

RUN apt-get update -y && apt-get install -y make
RUN mkdir -p /data /log && chown -R daemon /data /log

WORKDIR /opt
RUN mkdir -p mk

ADD base.mk /opt/mk/base.mk
RUN make -f mk/base.mk

ADD java.mk /opt/mk/java.mk
RUN make -f mk/java.mk

ADD zookeeper.mk /opt/mk/zookeeper.mk
RUN make -f mk/zookeeper.mk

ADD zoo.cfg /opt/zookeeper/conf/zoo.cfg
ADD start /opt/zookeeper/start

RUN chown -R daemon /opt/zookeeper

USER daemon
WORKDIR /opt/zookeeper
ENTRYPOINT ["/opt/zookeeper/start"]
EXPOSE 2181 2888 3888
