.PHONY: docker

docker: makefiles
	docker build --tag=influxdb .

MAKEFILES = base.mk influxdb.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done
