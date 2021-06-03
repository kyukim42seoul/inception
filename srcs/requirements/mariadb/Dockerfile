FROM	debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN	apt-get	install -y mariadb-server
RUN apt-get	install -y mariadb-client
RUN	apt-get install -y php-mysql
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
