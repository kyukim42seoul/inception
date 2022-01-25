FROM	debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN apt-get install -y dialog apt-utils
RUN	apt-get	install -y mariadb-server
RUN apt-get	install -y mariadb-client
RUN	apt-get install -y php-mysql
COPY entrypoint.sh /entrypoint.sh
COPY data/db.sql /db.sql
COPY conf/mariadb.cnf /mariadb.cnf
COPY conf/my.cnf /my.cnf
COPY conf/debian.cnf /debian.cnf
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]