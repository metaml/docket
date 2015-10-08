SHELL = /bin/bash
DEBIAN_FRONTEND = noninteractive

default: install-pkgs install-ssl-keys install-posgresql-conf install-start

PKGS = unzip curl sudo ruby
PKGS =+ postgresql-9.4 postgresql-contrib-9.4 libpq-dev
install-pkgs:
	for i in $(PKGS); do apt-get install -y $$i; done

install-ssl-keys:
	mkdir /etc/ssl/private-copy
	mv -f /etc/ssl/private/* /etc/ssl/private-copy/
	rm -rf /etc/ssl/private 
	mv -f /etc/ssl/private-copy /etc/ssl/private
	chmod -R go-rwx /etc/ssl/private
	chown -R postgres /etc/ssl/private

install-postgresql-conf:
	cp postgresql.conf /etc/postgresql/9.4/main/postgresql.conf
	cp pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf
	chown postgres:postgres /etc/postgresql/9.4/main/*.conf

install-start:
	cp start /opt/postgres/start
	chmod a+x /opt/postgres/start
