.PHONY: consul mkdir wget

VER = 0.6.4
CONSUL_URL = https://releases.hashicorp.com/consul/${VER}/consul_${VER}_linux_amd64.zip
CONSUL_ZIP := $(shell echo ${CONSUL_URL} | awk -F/ '{print $$NF}')
CONSUL := $(shell echo ${CONSUL_ZIP} | sed 's/\.zip//g')

consul: wget mkdir
	cd /opt/consul && unzip /var/tmp/${CONSUL_ZIP}
	rm -f /var/tmp/${CONSUL_ZIP}

mkdir:; mkdir -p /opt/consul

wget:; cd /var/tmp && wget ${CONSUL_URL}
