.PHONY: ubuntu-java makefiles clean

ubuntu-java: makefiles
	docker build --tag=$@ .

MAKEFILES = base-16.04.mk java.mk python.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
