all: build

build:
	docker-compose -f srcs/docker-compose.yml up -d --build

resume:
	docker-compose -f srcs/docker-compose.yml start

stop:
	docker-compose -f srcs/docker-compose.yml stop

restart: clean build

clean: stop
	docker-compose -f srcs/docker-compose.yml down -v
	

fclean: clean 
	docker system prune -af
	

re: fclean all
