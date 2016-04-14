FROM ubuntu:15.10
MAINTAINER ml (metaml@gmail.com)

RUN apt-get install -y make

USER root
WORKDIR /var/tmp

ADD base.mk base.mk
RUN make -f base.mk

ADD chronograf.mk chronograf.mk
RUN make -f chronograf.mk
RUN rm -f /opt/chronograf/config.toml
ADD config.toml /opt/chronograf/config.toml
RUN chown -R daemon:daemon /opt/chronograf

ADD start /opt/chronograf/start

WORKDIR /opt/chronograf
USER daemon
ENTRYPOINT ["/opt/chronograf/start"]
EXPOSE 10000
