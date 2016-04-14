.PHONY: docker

docker: makefiles
	docker build --tag=chronograf .

MAKEFILES = base.mk chronograf.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
