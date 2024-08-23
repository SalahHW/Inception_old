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
	php83-json \
	php83-phar

RUN adduser -D -S -G www-data www-data

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	-P /usr/local/bin/

WORKDIR /usr/local/bin/

RUN chmod +x wp-cli.phar && \
	mv wp-cli.phar wp && \
	ln -s /usr/bin/php83 /usr/bin/php
	
	
RUN mkdir -p /var/www/wordpress
	
WORKDIR /var/www/wordpress

COPY ./conf/php-fpm.conf /etc/php83/php-fpm.conf
COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf
COPY ./tools/wp-config.sh ./wp-config.sh

RUN	chmod +x ./wp-config.sh

ENTRYPOINT ["sh", "wp-config.sh"]
