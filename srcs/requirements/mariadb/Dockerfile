FROM		alpine:3.19
RUN			apk update && apk add mariadb mariadb-client

COPY		/conf/my.cnf /etc/mysql/mariadb.cnf
COPY		/conf/init.sql /init.sql