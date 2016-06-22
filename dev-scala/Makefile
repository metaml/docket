.PHONY: dev-scala makefiles clean

dev-scala: makefiles
	docker build -t $@ .

makefiles:; for i in ${MAKEFILES}; do cp ../mk/$$i .; done

clean:; rm -f ${MAKEFILES}

MAKEFILES = base.mk
MAKEFILES += cassandra.mk
MAKEFILES += java.mk
MAKEFILES += jq.mk
MAKEFILES += kafka.mk
MAKEFILES += maven.mk
MAKEFILES += pkgs.mk
MAKEFILES += sbt.mk
MAKEFILES += scala.mk
MAKEFILES += wget.mk
MAKEFILES += zinc.mk
MAKEFILES += zookeeper.mk
MAKEFILES += docker.mk
