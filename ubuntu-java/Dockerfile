FROM ubuntu:16.04
MAINTAINER ml (metaml@gmail.com)

RUN apt-get update -y && apt-get install -y make

USER root
WORKDIR /var/tmp

ADD base-16.04.mk base-16.04.mk
RUN make -f base-16.04.mk

ADD java.mk java.mk
RUN make -f java.mk

ADD python.mk python.mk
RUN make -f python.mk

CMD ["/bin/bash"]
