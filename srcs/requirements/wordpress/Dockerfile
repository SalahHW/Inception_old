FROM alpine:3.19

RUN apk update && \
	apk add --no-cache \
	wget \
	php83

RUN wget https://fr.wordpress.org/wordpress-6.6-fr_FR.tar.gz -P /var/www

WORKDIR /var/www/

RUN tar -xvf /var/www/wordpress-6.6-fr_FR.tar.gz && \
	rm -rf wordpress-6.6-fr_FR.tar.gz && \
	chown root:root ./wordpress