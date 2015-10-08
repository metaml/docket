FROM ubuntu:15.04
MAINTAINER M. Lee "metaml@gmail.com"

RUN apt-get install -y make

RUN mkdir -p /var/tmp/mk
COPY . /var/tmp/mk
WORKDIR /var/tmp/mk

RUN make -f base.mk && touch base.done
RUN make -f postgresql.mk && touch postgresql.done

ADD start /opt/postgres/start
RUN chmod a+x /opt/postgres/start

ENTRYPOINT ["/opt/postgres/start"]
