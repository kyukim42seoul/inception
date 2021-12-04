FROM	debian:buster

RUN apt-get update
RUN apt-get upgrade -y
<<<<<<< Updated upstream
RUN apt-get install -y vim
=======
RUN	apt-get install -y php7.3
>>>>>>> Stashed changes
RUN	apt-get	install -y mariadb-server
RUN apt-get	install -y mariadb-client
RUN	apt-get install -y php-mysql
COPY entrypoint.sh /entrypoint.sh
COPY conf/db.sql /db.sql
<<<<<<< Updated upstream
COPY data/mariadb.cnf /mariadb.cnf
COPY data/my.cnf /my.cnf
=======
COPY data/mysql.cnf /mysql.cnf
>>>>>>> Stashed changes
RUN chmod +x /entrypoint.sh
RUN mkdir data

ENTRYPOINT [ "/entrypoint.sh" ]
