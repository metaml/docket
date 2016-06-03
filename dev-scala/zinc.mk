ZINC_VER = 0.3.9
ZINC_URL = http://downloads.typesafe.com/zinc/${ZINC_VER}/zinc-${ZINC_VER}.tgz
ZINC_TGZ := $(shell echo ${ZINC_URL} | awk -F/ '{print $$NF}')

zinc: ## install zinc
	[ -d /opt ] ||  mkdir -p /opt
	if [ ! -d /opt/$@/bin ]; then \
		cd /var/tmp \
		&& wget ${ZINC_URL} \
		&& tar xvf ${ZINC_TGZ} \
		&& mv -f /var/tmp/zinc-${ZINC_VER} /opt/$@ \
		&& echo installed $@ in /opt/$@; \
	fi
