sleep 10

wp core download \
--locale=fr_FR \
--force

wp config create \
--allow-root \
--dbname=$DB_NAME \
--dbuser=$DB_USER \
--dbpass=$DB_USER_PASSWORD \
--dbhost=mariadb:3306 \
--force

wp core install \
--url=$WP_URL \
--title=$WP_TITLE \
--admin_user=$WP_ADMIN \
--admin_password=$WP_ADMIN_PASSWORD \
--admin_email=$WP_ADMIN_EMAIL \
--skip-email 