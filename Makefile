USER	=	salah
DATADIR =	/home/$(USER)/

start:
	docker compose -f srcs/docker-compose.yml up

stop:
	docker compose -f srcs/docker-compose.yml down
