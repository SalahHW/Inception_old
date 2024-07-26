#!/bin/sh

# start mariadb
echo "Starting mariadbd..."
mariadbd --user=mysql &

# wait until mariadb is ready
timeout=0
max_timeout=30
while ! mysqladmin ping --silent > /dev/null 2>&1; do
	echo "Waiting for mariadb..."
	if [ "$timeout" -gt "$max_timeout" ]; then
		echo "Error : mariadbd timed out"
		exit 1
	fi
    sleep 1
	timeout=$((timeout+1))
done

# create sql script
{
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > init.sql
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';" >> init.sql
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> init.sql
	echo "DROP USER IF EXISTS ''@'localhost';" >> init.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';" >> init.sql
	echo "FLUSH PRIVILEGES;" >> init.sql
}

# execute sql script
mariadb < init.sql

rm init.sql