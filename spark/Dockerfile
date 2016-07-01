FROM ubuntu-java:latest
MAINTAINER mlee (mlee@conductor.com)

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y make aptitude
RUN mkdir -p /data /log && chown -R daemon /data /log
RUN chmod -R a+rwx /data /log

WORKDIR /opt

RUN mkdir -p mk
ADD spark.mk /opt/mk/spark.mk

RUN cd /opt/mk && make -f spark.mk

WORKDIR /
USER root
CMD ["sleep", "infinity"]
