FROM alpine:3.19

RUN apk update && apk add \
	nginx \
	openssl

RUN mkdir -p /etc/nginx/ssl/ && \
	mkdir -p /run/nginx/

RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=ALSACE/L=Mulhouse/O=42/OU=student/CN=sbouheni/UID=sbouheni@student.42mulhouse.fr"

# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/inception.conf /etc/nginx/http.d/sbouheni.42.fr.conf

RUN rm -rf /etc/nginx/http.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]