.PHONY: webui mkdir wget
VER = 0.6.4
WEBUI_URL = https://releases.hashicorp.com/consul/${VER}/consul_${VER}_web_ui.zip
WEBUI := $(shell echo ${WEBUI_URL} | awk -F/ '{print $$NF}' | sed 's/\.zip//g')

webui: URL = ${WEBUI_URL}
webui: wget mkdir
	cd /opt/webui && unzip /var/tmp/${WEBUI}.zip

mkdir:; mkdir -p /opt/webui

wget:; cd /var/tmp && wget ${URL}
