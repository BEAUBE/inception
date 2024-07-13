all:build up 

build: 
	mkdir -p /home/ajoliet/data/wordpress
	mkdir -p /home/ajoliet/data/mariadb
	docker compose -f srcs/docker-compose.yml build

resume:
	docker compose -f srcs/docker-compose.yml start

suspend:
	docker compose -f srcs/docker-compose.yml stop

up: build 
	docker compose -f  srcs/docker-compose.yml up -d

stop:
	sudo rm -rf /home/ajoliet/data
	docker compose -f srcs/docker-compose.yml down -v --rmi all

re: stop all
