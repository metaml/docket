scyalla: makefiles
	docker build -t $@ .

MAKEFILES = scylla.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}

.PHONY: scylla makefiles clean
