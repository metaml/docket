.PHONY: cassandra-raw makefiles clean

cassandra-raw: makefiles
	cp -f cassandra-1.yaml cassandra.yaml
	docker build --tag=$@ .

cassandra-raw-3: makefiles
	for i in 0 1 2; do \
		sed "s/listen_address: cassandra-raw/listen_address: cassandra-raw-$$i/g" cassandra-3.yaml \
			> cassandra.yaml; \
		docker build --tag=cassandra-raw-$$i .; \
	done

MAKEFILES = base.mk java.mk python.mk cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
