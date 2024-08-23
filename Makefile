start:
	@mkdir -p /home/salah/data/mariadb
	@mkdir -p /home/salah/data/wordpress
	sudo docker compose -f srcs/docker-compose.yml up -d

stop:
	docker compose -f srcs/docker-compose.yml down

clean: stop
	@sudo rm -rf /home/salah/data/mariadb
	@sudo rm -rf /home/salah/data/wordpress
	@docker system prune -af
	@docker volume rm -f srcs_mariadb
	@docker volume rm -f srcs_wordpress

re: clean start
