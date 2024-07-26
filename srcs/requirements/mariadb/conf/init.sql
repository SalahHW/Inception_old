-- creating wordpress database
CREATE DATABASE IF NOT EXISTS $DB_NAME;

-- creating user
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';

-- give all privileges to user on all object of wordpress database
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';

-- immediate application of changes
FLUSH PRIVILEGES;