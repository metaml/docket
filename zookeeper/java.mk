.PHONY: default java update ppa

JAVA_HOME = /usr/lib/jvm/java-8-oracle

default: ppa update java

java:
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
	apt-get install --force-yes -y oracle-java8-installer
	apt-get install --force-yes -y oracle-java8-set-default

update:; apt-get update -y && apt-get upgrade -y

ppa:; add-apt-repository -y ppa:webupd8team/java
