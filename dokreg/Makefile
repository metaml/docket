up: docker compose

docker: docker-consul
	(cd ../../.. && stack clean && stack build --jobs=8)
	cp ../../../bin/dokreg dokreg
	docker build -t dokreg .

compose:; docker-compose up

docker-consul:;	(cd ../consul && make docker)
