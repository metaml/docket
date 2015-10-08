FROM ubuntu:15.04
MAINTAINER ml (metaml@gmail.com)
# at runtime, dokreg opens /var/run/docker.sock
ENV DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US en_US.UTF-8 \
    && dpkg-reconfigure locales  \
    && update-locale LC_ALL="en_US.UTF-8"
RUN apt-get update -y && apt-get install -y --quiet unzip ruby curl wget

RUN mkdir -p /opt/dokreg && chown -R daemon /opt/dokreg
ADD dokreg /opt/dokreg/dokreg
ADD start /opt/dokreg/start

USER daemon
ENTRYPOINT ["/opt/dokreg/start"]
