.PHONY: docker start makefiles clean

docker: makefiles
	docker build -t kafka .

run:; docker run kafka

debug:;	docker run --interactive=true --tty=true --user=root --entrypoint=/bin/bash kafka

MAKEFILES = base.mk java.mk kafka.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
