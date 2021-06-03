FROM	debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN	apt-get install -y wget
RUN	apt-get install -y php-fpm
RUN	wget https://wordpress.org/latest.tar.gz
RUN mkdir WordPress
COPY entrypoint.sh /entrypoint.sh
COPY wp-config.php /wp-config.php
RUN chmod +x /entrypoint.sh
RUN mkdir -p /run/php

ENTRYPOINT [ "/entrypoint.sh"]
