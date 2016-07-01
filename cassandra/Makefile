.PHONY: cassandra makefiles clean

# fo dev
cassandra: makefiles
	cp -f cassandra-1.yaml cassandra.yaml
	docker build --tag=$@ .

# for dev
cassandra-3: makefiles
	sed "s/seeds: deck-cassandra-0.marathon.mesos,deck-cassandra-1.marathon.mesos,deck-cassandra-2.marathon.mesos/seeds: cassandra-0,cassandra-1,cassandra-2/g" cassandra-dcos.yaml > cassandra.yaml
	docker build --tag=$@ .

cassandra-dcos: makefiles
	cp -f cassandra-dcos.yaml cassandra.yaml
	docker build --file=Dockerfile.dcos --tag=deck-cassandra .

cassandra-dcos-push:
	docker tag deck-cassandra metaml/deck-cassandra
	docker push metaml/deck-cassandra

MAKEFILES = base.mk java.mk python.mk cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
