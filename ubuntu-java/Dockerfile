FROM ubuntu:15.10
MAINTAINER ml (metaml@gmail.com)

RUN apt-get update -y && apt-get install -y make

USER root
WORKDIR /var/tmp

ADD base.mk base.mk
RUN make -f base.mk

ADD java.mk java.mk
RUN make -f java.mk

ADD python.mk python.mk
RUN make -f python.mk

CMD ["/bin/bash"]
