FROM alpine:3.14

RUN apk update && \
	apk add mariadb mariadb-common mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

COPY tools/setup.sh /
COPY conf/my.cnf /etc/my.cnf

EXPOSE 3306

RUN chmod +x ./setup.sh

ENTRYPOINT [ "./setup.sh" ]
