.PHONY: docker makefiles clean

consul: makefiles
	docker build -t $@ .

MAKEFILES = base.mk consul.mk webui.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
