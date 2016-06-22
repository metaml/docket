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

cassandra-raw-dcos: makefiles
	for i in 0 1 2; do \
		sed "s/seeds: \"cassandra-0,cassandra-1,cassandra-2\"/seeds: \"deck-cassandra-raw-0.marathon.mesos,deck-cassandra-raw-1.marathon.mesos,deck-cassandra-raw-2.marathon.mesos/g" cassandra-3.yaml > cassandra-t.yaml; \
		sed "s/listen_address: cassandra/listen_address: deck-cassandra-raw-$$i.marathon.mesos/g" cassandra-t.yaml > cassandra.yaml; \
		docker build --tag=deck-cassandra-raw-$$i .; \
	done

MAKEFILES = base.mk java.mk python.mk cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

push:
	for i in 0 1 2; do \
		docker tag deck-cassandra-raw-$$i metaml/deck-cassandra-raw-$$i; \
		docker push metaml/deck-cassandra-raw-$$i; \
	done


clean:; rm -f ${MAKEFILES}
