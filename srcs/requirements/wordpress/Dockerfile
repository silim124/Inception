FROM alpine:3.14

RUN apk update && \
	apk add openrc \
	php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache

RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xvf /latest.tar.gz && rm -rf /latest.tar.gz \
	&& mkdir -p /var/www/ && mv wordpress/ /var/www/

COPY /conf/wp-config.php ${WP_VOLUME}

RUN openrc
RUN touch /run/openrc/softlevel

# 유저:그룹
RUN chown -R nobody:nobody ${WP_VOLUME} \
&& chmod -R 775 ${WP_VOLUME}

COPY /conf/www.conf /etc/php7/php-fpm.d/

EXPOSE 9000

# This is a variant of PHP that will run in the background as a daemon, listening for CGI requests.
CMD [ "php-fpm7", "-F" ]
