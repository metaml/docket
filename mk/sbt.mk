SBT_VER = 0.13.11
SBT_URL = https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VER}/sbt-${SBT_VER}.tgz
SBT_TGZ := $(shell echo ${SBT_URL} | awk -F/ '{print $$NF}')

sbt: ## install sbt
	[ -d /opt ] || sudo mkdir -p /opt
	if [ ! -f /opt/$@/bin ]; then \
		cd /var/tmp \
		&& wget ${SBT_URL} \
		&& tar xvf ${SBT_TGZ} \
		&& echo sudo needed here: \
		&& sudo mv -f /var/tmp/$@ /opt/. \
		&& echo installed $@; \
	fi
