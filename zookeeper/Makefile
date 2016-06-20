.PHONY: docker start makefiles clean

zookeeper: makefiles
	cp -f zoo-1.cfg zoo.cfg
	cp -f start-1 start
	docker build -t zookeeper .

zookeeper-3: makefiles
	for i in 0 1 2; do \
		echo $$((i+1)) > myid; \
		cp -f zoo-3.cfg zoo.cfg; \
		cp -f start-3 start; \
		docker build --tag=zookeeper-$$i .; \
	done

run:; docker run zookeeper

debug:;	docker run --interactive=true --tty=true --user=root --entrypoint=/bin/bash zookeeper

MAKEFILES = base.mk java.mk zookeeper.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
