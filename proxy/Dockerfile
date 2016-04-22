FROM ubuntu:15.10
MAINTAINER ml (metaml@gmail.com)

RUN apt-get install -y make

USER root
WORKDIR /var/tmp

ADD base.mk base.mk
RUN make -f base.mk

ADD proxy.mk proxy.mk
RUN make -f proxy.mk

ADD start /opt/proxy/start

WORKDIR /opt/proxy
USER daemon
ENTRYPOINT ["/opt/proxy/start"]
EXPOSE 8080
