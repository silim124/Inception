FROM alpine:3.15

RUN apk update && \
	apk add mariadb mariadb-common mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

RUN mkdir -p /run/mysqld

COPY tools/ /
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

CMD [ "sh", "setup.sh" ]
