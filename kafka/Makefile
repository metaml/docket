.PHONY: docker cluster run debug makefiles clean

kafka: makefiles
	cp server-1.properties server.properties
	docker build -t kafka .

kafka-3: makefiles
	for i in 0 1 2; do \
		sed "s/broker.id=0/broker.id=$$i/g" server-1.properties > server-t.properties; \
		sed "s/zookeeper:2181/zookeeper-0:2181,zookeeper-0:2181,zookeeper-1:2181/g" server-t.properties > server.properties; \
		docker build --tag=kafka-$$i .; \
	done

MAKEFILES = base.mk java.mk kafka.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
