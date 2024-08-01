FROM alpine:3.19

RUN apk update && \
	apk add --no-cache \
	wget \
	php83 \
	php83-fpm \
	php83-mysqli \
	php83-xml \
	php83-gd \
	php83-curl \
	php83-zip \
	php83-mbstring \
	php83-exif \
	php83-openssl \
	php83-json


RUN wget https://fr.wordpress.org/wordpress-6.6-fr_FR.tar.gz \
-P /var/www \
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	-P /usr/local/bin/wp-cli/

WORKDIR /var/www/

RUN tar -xvf /var/www/wordpress-6.6-fr_FR.tar.gz && \
rm -rf wordpress-6.6-fr_FR.tar.gz && \
chown root:root ./wordpress

WORKDIR /

COPY ./conf/php-fpm.conf /etc/php83/php-fpm.conf
COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf