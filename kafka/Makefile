.PHONY: docker cluster run debug makefiles clean

docker: makefiles
	docker build -t kafka .

cluster:; docker-compose up

MAKEFILES = base.mk java.mk kafka.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

DOCKERID ?= kafka_kafka_1
run:; docker run kafka
debug:;	docker run --interactive=true --tty=true --user=root --entrypoint=/bin/bash ${DOCKERID}
shell:;	docker exec --interactive=true --tty=true --user=root ${DOCKERID} /bin/bash || true

topic-url:; make topic TOPIC=url
topic-err:; make topic TOPIC=err
topic-test:; make topic TOPIC=test
topic:;	docker exec --tty=true ${DOCKERID} bin/kafka-topics.sh --create \
		--zookeeper zookeeper:2181 \
		--replication-factor 1 \
		--partitions 1 \
		--topic ${TOPIC}

list-topic:; docker exec --tty=true ${DOCKERID} bin/kafka-topics.sh --list \
		--zookeeper zookeeper:2181

info:; for i in kafka_kafka_1 kafka_zookeeper_1; do docker exec --tty=true $$i ip addr show; done

clean:; rm -f ${MAKEFILES}
