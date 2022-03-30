FROM alpine:3.14

RUN apk update && \
	add mariadb mariadb-common mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

COPY conf/wordpress.sql .

EXPOSE 3306

ENTRYPOINT [ "./run.sh" ]
