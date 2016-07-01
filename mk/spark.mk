VER = 1.6.2
URL = http://d3kbcqa49mib13.cloudfront.net/spark-${VER}-bin-without-hadoop.tgz
TGZ = $(shell echo ${URL} | awk -F/ '{print $$NF}')
DIR = $(subst .tgz,,${TGZ})

spark: get-spark mkdir
	mv -f /var/tmp/${DIR}/* /opt/spark/.

mkdir:;	mkdir -p /opt/spark

get-spark:
	cd /var/tmp && curl ${URL} > ${TGZ}
	cd /var/tmp && tar xzf ${TGZ} && rm -f ${TGZ}

.PHONY: spark mkdir get-spark
