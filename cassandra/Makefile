.PHONY: cassandra makefiles clean

# for dev: hostname "cassandra" is defined in the docker-compose.yaml file
cassandra: makefiles
	sed "s/_SEEDS_/cassandra/g" cassandra.tmpl > cassandra.yaml
	docker build --tag=$@ .

# for dev: hostnames "cassandra-[0-2]" are defined in the docker-compose.yaml file
cassandra-3: makefiles
	sed 's/_SEEDS_/cassandra-0,cassandra-1,cassandra-2/g' cassandra.tmpl > cassandra.yaml
	docker build --tag=$@ .

cassandra-dcos: makefiles
	docker build --file=Dockerfile-dcos --tag=deck-cassandra .

cassandra-dcos-push:
	docker tag deck-cassandra metaml/deck-cassandra
	docker push metaml/deck-cassandra

MAKEFILES = cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES} *.yaml *.mk
