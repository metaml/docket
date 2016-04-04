.PHONY: docker cluster run debug makefiles clean

docker: makefiles
	docker build -t kafka .

MAKEFILES = base.mk java.mk kafka.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
