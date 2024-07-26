USER	=	salah
DATADIR =	/home/$(USER)/

start:
	docker compose -f srcs/docker-compose.yml up

stop:
	docker compose -f srcs/docker-compose.yml down

clean: stop
	@docker system prune -af
	@docker volume rm -f srcs_mariadb

re: clean start
