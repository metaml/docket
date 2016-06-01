.PHONY: cassandra-raw makefiles clean

cassandra-raw: makefiles
	docker build --tag=$@ .

MAKEFILES = base.mk java.mk python.mk cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
