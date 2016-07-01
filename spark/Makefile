.PHONY: spark clean

spark: spark.mk
	docker build -t spark .

spark.mk: ../mk/spark.mk
	cp ../mk/spark.mk .

../mk/spark.mk:
	cp ../mk/spark.mk .

clean:; rm -f spark.mk
