FROM ubuntu:15.10
MAINTAINER ml (metaml@gmail.com)

RUN apt-get install -y make

USER root
WORKDIR /var/tmp

ADD base.mk base.mk
RUN make -f base.mk

ADD influxdb.conf /opt/influxdb/usr/etc/influxdb.conf
ADD start /opt/influxdb/start

ADD influxdb.mk influxdb.mk
RUN make -f influxdb.mk
RUN chown -R daemon:daemon /opt/influxdb /usr/sbin
RUN apt-get install -y rlwrap

WORKDIR /opt/influxdb
USER daemon
ENTRYPOINT ["/opt/influxdb/start"]
EXPOSE 8083 8086 8088 8091
