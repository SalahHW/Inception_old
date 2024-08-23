#!/bin/sh

sleep 15

if [ -f wp-config.php ];
  then
    echo "wordpress is already installed"
  else
	wp core download \
	--locale=fr_FR

	wp config create \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_USER_PASSWORD \
	--dbhost=mariadb:3306

	wp core install \
	--url=$WP_URL \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email

    wp user create \
	"$WP_USER" "$WP_USER_MAIL" \
    --user_pass="$WP_USER_PASSWORD" \
    --display_name="$WP_DISPLAY_NAME" \
    --role="author"
fi

chown -R www-data:www-data /var/www/wordpress

php-fpm83 --nodaemonize