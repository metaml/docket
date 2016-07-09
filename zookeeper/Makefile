.PHONY: docker start makefiles clean

zookeeper: makefiles
	docker build --tag=deck-zookeeper .

zookeeper-dcos: makefiles
	docker build --file=Dockerfile-dcos --tag=deck-zookeeper .

zookeeper-dcos-push:
	docker tag deck-zookeeper metaml/deck-zookeeper
	docker push metaml/deck-zookeeper

MAKEFILES = zookeeper.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
