FROM alpine:3.14

RUN apk update && add nginx openrc vim openssl

RUN mkdir -p /var/www/html/

RUN chown -R nginx:nginx /var/lib/nginx
RUN chown -R nginx:nginx /var/www/html

COPY /conf/nginx.conf /etc/nginx/

RUN openrc
RUN touch /run/openrc/softlevel

RUN mkdir /etc/nginx/ssl && openssl req \
	-x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout ${CERTS_NGINX_KEY} \
	-out ${CERTS_NGINX_CRT} \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=Inception"

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
