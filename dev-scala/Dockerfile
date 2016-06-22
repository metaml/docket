FROM ubuntu-java:latest
MAINTAINER mlee (mlee@conductor.com)

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y make aptitude
RUN mkdir -p /data/zookeeper /log/kafka && chown -R daemon /data /log
RUN chmod -R a+rwx /data /log

WORKDIR /opt

RUN mkdir -p mk
ADD cassandra.mk /opt/mk/cassandra.mk
ADD jq.mk /opt/mk/jq.mk
ADD kafka.mk /opt/mk/kafka.mk
ADD maven.mk /opt/mk/maven.mk
ADD pkgs.mk /opt/mk/pkgs.mk
ADD sbt.mk /opt/mk/sbt.mk
ADD scala.mk /opt/mk/scala.mk
ADD wget.mk /opt/mk/wget.mk
ADD zinc.mk /opt/mk/zinc.mk
ADD zookeeper.mk /opt/mk/zookeeper.mk
ADD docker.mk /opt/mk/docker.mk

RUN for i in cassandra.mk jq.mk kafka.mk maven.mk pkgs.mk sbt.mk scala.mk wget.mk zinc.mk zookeeper.mk; do \
        if ! make -f /opt/mk/$i; then \
           echo $i; \
           exit 1; \
        fi \
    done

WORKDIR /
USER root
CMD ["sleep", "infinity"]
