.PHONY: docker

docker: makefiles
	docker build --tag=cassandra .

MAKEFILES = base.mk java.mk cassandra.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done
