#FROM ubuntu:15.10
FROM ubuntu:16.04
MAINTAINER mlee (mlee@conductor.com)

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y make
RUN mkdir -p /data/zookeeper /log/kafka && chown -R daemon /data /log
RUN chmod -R a+rwx /data /log

WORKDIR /opt
RUN mkdir -p mk

ADD base.mk /opt/mk/base.mk
ADD java.mk /opt/mk/java.mk
ADD jq.mk /opt/mk/jq.mk
ADD kafka.mk /opt/mk/kafka.mk
ADD maven.mk /opt/mk/maven.mk
ADD pkgs.mk /opt/mk/pkgs.mk
ADD sbt.mk /opt/mk/sbt.mk
ADD scala.mk /opt/mk/scala.mk
ADD wget.mk /opt/mk/wget.mk
ADD zinc.mk /opt/mk/zinc.mk
ADD zookeeper.mk /opt/mk/zookeeper.mk

RUN for i in base.mk java.mk jq.mk kafka.mk maven.mk pkgs.mk sbt.mk scala.mk wget.mk zinc.mk zookeeper.mk; do \
        echo $i; \
        make -f /opt/mk/$i; \
    done

WORKDIR /
USER root
CMD ["sleep", "infinity"]
