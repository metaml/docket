.PHONY: docker makefiles clean

docker: makefiles
	docker build --tag=cassandra .

MAKEFILES = base.mk java.mk python.mk cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
