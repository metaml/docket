.PHONY: cassandra-raw makefiles clean

cassandra-raw: makefiles
	sed 's/_SEEDS_/cassandra-raw/g' cassandra.tmpl > cassandra.yaml
	docker build --tag=$@ .

cassandra-raw-3: SEEDS = cassandra-raw-0,cassandra-raw-1,cassandra-raw-2
cassandra-raw-3: makefiles
	sed "s/_SEEDS_/${SEEDS}/g" cassandra.tmpl > cassandra.yaml
	docker build --tag=cassandra-raw .

cassandra-raw-dcos: makefiles
	docker build --file Dockerfile-dcos --tag=deck-cassandra-raw .

cassandra-raw-dcos-push:
	docker tag deck-cassandra-raw metaml/deck-cassandra-raw
	docker push metaml/deck-cassandra-raw

MAKEFILES = cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f *.yaml *.mk
