.PHONY: docker makefiles clean

docker: makefiles
	docker build -t haproxy .

MAKEFILES = base.mk haproxy.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
