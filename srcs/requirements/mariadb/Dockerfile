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
COPY /conf/init.sql /init.sql

EXPOSE 3306

ARG DB_NAME
ARG DB_USER
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD

CMD [ "mariadbd", "--user=mysql" ]