FROM ubuntu-java:latest
MAINTAINER ml (metaml@gmail.com)

RUN mkdir -p /opt/mk /opt/scylla
WORKDIR /opt/mk

ADD scylla.mk /opt/mk
RUN make -f scylla.mk

ADD start /opt/syclla/start

EXPOSE 7199 9042 9160
WORKDIR /opt/scylla
USER daemon
ENTRYPOINT ["/opt/scylla/start"]
