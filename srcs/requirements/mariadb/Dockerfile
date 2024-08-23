FROM alpine:3.19

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN	mkdir -p /var/lib/mysql/ &&\
	mkdir -p /run/mysqld/ &&\
	chown -R mysql:mysql /var/lib/mysql/ &&\
	touch /run/mysqld/mysqld.sock &&\
	chown -R mysql:mysql /run/mysqld/ &&\
	chmod 775 /run/mysqld/mysqld.sock &&\
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY /conf/mariadb.cnf /etc/mysql/my.cnf
COPY /tools/entrypoint.sh /entrypoint.sh

EXPOSE 3306

RUN chmod +x entrypoint.sh &&\
	./entrypoint.sh

CMD [ "mariadbd", "--user=mysql" ]