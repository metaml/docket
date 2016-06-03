SCALA_VER = 2.11.8
SCALA_URL = http://downloads.lightbend.com/scala/${SCALA_VER}/scala-${SCALA_VER}.tgz
SCALA_TGZ := $(shell echo ${SCALA_URL} | awk -F/ '{print $$NF}')

scala: ## install scala
	[ -d /opt ] || sudo mkdir -p /opt
	if [ ! -f /opt/$@/bin ]; then \
		cd /var/tmp \
		&& wget ${SCALA_URL} \
		&& tar xvf ${SCALA_TGZ} \
		&& echo sudo needed here: \
		&& sudo mv -f /var/tmp/$@-${SCALA_VER} /opt/$@ \
		&& echo installed $@; \
	fi
