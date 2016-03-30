.PHONY: docker makefiles clean

docker: makefiles
	docker build -t dev-scala .

MAKEFILES = base.mk java.mk maven.mk kafka.mk zookeeper.mk jq.mk wget.mk pkgs.mk
makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}
