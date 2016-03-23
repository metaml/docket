FROM ubuntu:15.10
MAINTAINER ml (metaml@gmail.com)

ENV DEBIAN_FRONTEND noninteractive  

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y --quiet unzip curl wget vim

RUN mkdir -p /opt/consul/bin /opt/consul/etc && chown -R daemon /opt/consul
ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip /tmp/consul.zip
RUN unzip /tmp/consul.zip -d /opt/consul/bin/ && chmod +x /opt/consul/bin/*
ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip  /tmp/webui.zip
RUN unzip /tmp/webui.zip -d /opt/consul && mv -f /opt/consul/dist /opt/consul/webui
RUN rm -f /tmp/*.zip

ADD start /opt/consul/start
RUN chmod a+x /opt/consul/start
ADD consul.json /opt/consul/etc/consul.json
RUN chmod a+r /opt/consul/etc/consul.json

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
