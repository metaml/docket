help:; @echo "make (start|stop|restart|status)"

start:
	sudo systemctl start docker.service
	sudo systemctl start docker.socket

stop:
	sudo systemctl stop docker.socket
	sudo systemctl stop docker.service

restart:; sudo systemctl restart docker.service

status:
	sudo systemctl status docker
