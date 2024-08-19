USER	=	salah
DATADIR =	/home/$(USER)/

start:
	@sudo mkdir -p /home/sbouheni/data/mariadb
	@sudo mkdir -p /home/sbouheni/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d

stop:
	docker compose -f srcs/docker-compose.yml down

clean: stop
	@sudo rm -rf /home/sbouheni/data/mariadb
	@sudo rm -rf /home/sbouheni/data/wordpress
	@docker system prune -af
	@docker volume rm -f srcs_mariadb
	@docker volume rm -f srcs_wordpress

re: clean start
