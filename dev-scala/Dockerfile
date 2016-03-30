FROM ubuntu:15.10
MAINTAINER mlee (mlee@conductor.com)

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y make
RUN mkdir -p /data/zookeeper /log/kafka && chown -R daemon /data /log
RUN chmod -R a+rwx /data /log

WORKDIR /opt
RUN mkdir -p mk

ADD base.mk /opt/mk/base.mk
RUN make -f mk/base.mk

ADD java.mk /opt/mk/java.mk
RUN make -f mk/java.mk

ADD jq.mk /opt/mk/jq.mk
RUN make -f mk/jq.mk

ADD kafka.mk /opt/mk/kafka.mk
RUN make -f mk/kafka.mk

ADD maven.mk /opt/mk/maven.mk
RUN make -f mk/maven.mk

ADD pkgs.mk /opt/mk/pkgs.mk
RUN make -f mk/pkgs.mk

ADD wget.mk /opt/mk/wget.mk
RUN make -f mk/wget.mk

ADD zookeeper.mk /opt/mk/zookeeper.mk
RUN make -f mk/zookeeper.mk

WORKDIR /
USER root
CMD ["sleep", "infinity"]
