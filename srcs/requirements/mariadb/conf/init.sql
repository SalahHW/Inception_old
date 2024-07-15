-- creating wordpress database
CREATE DATABASE IF NOT EXISTS wordpress;

-- creating user
-- TODO: Use .env instead of user and password
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';

-- give all privileges to user on all object of wordpress database
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';

-- immediate application of changes
FLUSH PRIVILEGES;