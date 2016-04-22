.PHONY: docker

docker: makefiles
	docker build --tag=proxy .

MAKEFILES = base.mk proxy.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
