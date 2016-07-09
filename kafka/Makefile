kafka: makefiles
	docker build -t kafka .

kafka-dcos: makefiles
	docker build --file=Dockerfile-dcos --tag=deck-kafka .

kafka-dcos-push:
	docker tag deck-kafka metaml/deck-kafka
	docker push metaml/deck-kafka

MAKEFILES = kafka.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}

.PHONY: kafka kafka-dcos makefiles clean
