.PHONY: docker start makefiles clean

docker: makefiles
	docker build -t zookeeper .

run:; docker run zookeeper

debug:;	docker run --interactive=true --tty=true --user=root --entrypoint=/bin/bash zookeeper

MAKEFILES = base.mk java.mk zookeeper.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
