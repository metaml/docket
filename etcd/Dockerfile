FROM ubuntu:15.10
MAINTAINER ml (metaml@gmail.com)

WORKDIR /var/tmp

RUN apt-get update -y && apt-get install -y make
ADD base.mk /var/tmp/base.mk
ADD consul.mk /var/tmp/consul.mk
ADD webui.mk /var/tmp/webui.mk
RUN for i in base.mk consul.mk webui.mk; do make -f $i; done

ADD start /opt/consul/start
RUN chmod a+x /opt/consul/start

ADD consul.json /opt/consul/consul.json
RUN chmod a+r /opt/consul/consul.json

RUN mkdir -p /data /log && chown daemon /data /log
EXPOSE 53 53/udp 8300 8301 8301/udp 8302 8302/udp 8400 8500

WORKDIR /opt/consul
USER root
ENTRYPOINT ["/opt/consul/start"]

# consul service ports:
# - server rpc: 8300
# - serf lan: 8301
# - serf wan: 8302
# - client rpc: 8400
# - http api: 8500 (wui)
# - dns: 8600
