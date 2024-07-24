FROM		alpine:3.19
RUN			apk update && apk add mariadb mariadb-client

COPY		/conf/my.cnf /etc/mysql/my.cnf
COPY		/conf/init.sql /docker-entrypoint-initdb.d/

RUN mkdir -p /var/run/mysqld && \
    mkdir -p /etc/mysql && \
    mkdir -p /var/lib/mysql && \
    chmod 777 /var/run/mysqld && \
    touch /var/run/mysqld/mysqld.sock && \
    chown -R mysql:mysql /var/run/mysqld && \
    chown -R mysql:mysql /etc/mysql/ && \
    chown -R mysql:mysql /var/lib/mysql && \
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

CMD ["mariadbd", "--user=mysql"]