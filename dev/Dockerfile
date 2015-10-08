FROM ubuntu:15.04
MAINTAINER ml (metaml@gmail.com)
# stolen from github.com/numenta/nupic

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US en_US.UTF-8 \
    && dpkg-reconfigure locales  \
    && update-locale LC_ALL="en_US.UTF-8"
RUN apt-get install -y software-properties-common wget curl sudo \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 99E82A75642AC823 \
    && echo "deb http://dl.bintray.com/sbt/debian /" \
       | tee -a /etc/apt/sources.list.d/sbt.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db \
    && echo "deb http://mariadb.mirror.iweb.com/repo/10.0/ubuntu `lsb_release -cs` main" \
       > /etc/apt/sources.list.d/mariadb.list \
    && wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key \
       | sudo apt-key add - \
    && echo 'deb http://download.fpcomplete.com/ubuntu/vivid stable main' \
       | sudo tee /etc/apt/sources.list.d/fpco.list \
    && add-apt-repository -y ppa:webupd8team/java \
    && apt-get update -y && apt-get upgrade -y \
    && apt-get install -y unzip bzip2 wget curl ca-certificates make pkg-config

env JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true \
    | debconf-set-selections \
    && apt-get install --force-yes -y oracle-java8-installer \
    && apt-get install --force-yes -y oracle-java8-set-default

RUN mkdir -p /data /log && chown daemon /data /log

# rlwrap and libc6-i386 needed by kdb+ (q)
RUN apt-get install -y binutils gcc g++ gfortran cmake git python-dev cython python-pip \
                       python-tk python-pmw python-imaging python-matplotlib ruby automake \
                       libtool libssl-dev libpcre3-dev openssl libssl-dev libmsgpack-dev libyaml-dev libopenblas-dev \
                       liblapack-dev libatlas-dev libtiff-dev libpng12-dev libjpeg-dev libfreetype6-dev libwebp-dev \
                       libwebpmux1 libgmp-dev libmpfr-dev libmpc-dev libisl-dev libfreetype6-dev \
                       net-tools iputils-ping telnet netcat lsof less dnsutils tk \
                       rlwrap libc6-i386 \
                       mysql-client
RUN apt-get install --force-yes -y --quiet sbt maven

ENV SCALA_VERSION 2.11.7
ENV SCALA_MAJOR_VERSION 2.11
ENV SCALA_HOME /opt/scala
RUN mkdir -p ${SCALA_HOME} \
    && wget -qO- http://www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.tgz \
       | tar -xzC ${SCALA_HOME} --strip-components=1 \
    && rm -f /opt/scala/bin/*.bat \
    && ln -fs /opt/scala/bin/* /usr/local/bin/.

ADD ghc.mk /var/tmp/ghc.mk
RUN make -f /var/tmp/ghc.mk
RUN touch /var/tmp/ghc.mk.fin

ENV GRADLE_VERSION 2.6
ENV GRADLE_HOME /opt/gradle
RUN cd /var/tmp \
    && wget -q https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip -q gradle-${GRADLE_VERSION}-bin.zip \
    && rm -f gradle-${GRADLE_VERSION}-bin.zip \
    && mv -f gradle-${GRADLE_VERSION} /opt/gradle \
    && rm -f /opt/gradle/bin/*.bat \
    && ln -sf /opt/gradle/bin/* /usr/local/bin/.

RUN mkdir -p /src && cd /src \
    && git clone https://github.com/numenta/nupic \
    && git clone https://github.com/numenta/nupic.core \
    && git clone https://github.com/numenta/NAB \
    && git clone https://github.com/numenta/htm.java \
    && git clone https://github.com/numenta/htm.java-examples \
    && git clone https://github.com/numpy/numpy

WORKDIR /src/htm.java
RUN gradle check && gradle clean

WORKDIR /src/htm.java-examples
RUN gradle check && gradle clean

RUN apt update -y && apt upgrade -y

# @todo: change to non-root but for now let's get it to work
env USER root
env NUPIC /src/nupic
env NTA_DATA_PATH /src/nupic/prediction/data
RUN pip install --upgrade pip setuptools psutil matplotlib
RUN cd /src/numpy && python setup.py install
RUN cd /src/nupic && python setup.py install --prefix=/usr/local --exec-prefix=/usr/local

env QHOME=/opt/q
ADD q /opt/q

WORKDIR /data
USER root
CMD "sleep infinity"
