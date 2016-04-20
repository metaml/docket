FROM ubuntu:15.10

RUN mkdir -p /data /log && chown -R daemon /data /log
RUN mkdir -p /opt/haproxy /opt/mk
RUN apt-get install -y make

WORKDIR /opt

ADD base.mk /opt/mk/base.mk
RUN make -f mk/base.mk

ADD haproxy.mk /opt/mk/haproxy.mk
RUN make -f mk/haproxy.mk

ADD haproxy.cfg /etc/haproxy/haproxy.cfg

ADD start /opt/haproxy/start

WORKDIR /etc/haproxy
ENTRYPOINT ["/opt/haproxy/start"]

EXPOSE 80 443 8080
