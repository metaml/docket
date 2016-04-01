.PHONY: docker cluster run debug makefiles clean

docker: makefiles
	docker build -t kafka .

MAKEFILES = base.mk java.mk kafka.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

cluster:
	( docker-compose up 2>&1 >> /var/tmp/$@.log ) &
	( docker-compose scale dev-scala=2 2>&1 >> /var/tmp/$@.log ) &
	tail -f /var/tmp/$@.log
