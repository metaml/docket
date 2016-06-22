.PHONY: cassandra makefiles clean

cassandra: makefiles
	cp -f cassandra-1.yaml cassandra.yaml
	docker build --tag=$@ .

cassandra-3: makefiles
	for i in 0 1 2; do \
		sed "s/listen_address: cassandra/listen_address: cassandra-$$i/g" cassandra-3.yaml \
			> cassandra.yaml; \
		docker build --tag=cassandra-$$i .; \
	done

cassandra-dcos: makefiles
	for i in 0 1 2; do \
		sed "s/seeds: \"cassandra-0,cassandra-1,cassandra-2\"/seeds: \"deck-cassandra-0.marathon.mesos,deck-cassandra-1.marathon.mesos,deck-cassandra-2.marathon.mesos/g" cassandra-3.yaml \
			> cassandra-t.yaml; \
		sed "s/listen_address: cassandra/listen_address: deck-cassandra-$$i.marathon.mesos/g" cassandra-t.yaml \
			> cassandra.yaml; \
		docker build --tag=deck-cassandra-$$i .; \
	done

MAKEFILES = base.mk java.mk python.mk cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}

push:
	for i in 0 1 2; do \
		docker tag deck-cassandra-$$i metaml/deck-cassandra-$$i; \
		docker push metaml/deck-cassandra-$$i; \
	done
