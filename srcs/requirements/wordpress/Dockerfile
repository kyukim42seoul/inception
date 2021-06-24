FROM	debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN	apt-get install -y wget
RUN	apt-get install -y curl
RUN	apt-get install -y php-fpm
RUN	wget https://wordpress.org/latest.tar.gz
RUN	apt-get install -y php7.3-mysqli
RUN mkdir WordPress
COPY entrypoint.sh /entrypoint.sh
COPY wp-config.php /wp-config.php
COPY WordPress/php.ini /php.ini
COPY www.conf /www.conf
RUN chmod +x /entrypoint.sh
RUN mkdir -p /run/php

ENTRYPOINT [ "/entrypoint.sh"]
