FROM	debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN	apt-get install -y curl
RUN	apt-get install -y php-fpm
RUN	apt-get install -y php7.3-mysqli
RUN apt-get install dialog apt-utils
COPY entrypoint.sh /entrypoint.sh
COPY conf/wp-config.php /wp-config.php
COPY conf/www.conf /www.conf
RUN chmod +x /entrypoint.sh
RUN mkdir -p /run/php

ENTRYPOINT [ "/entrypoint.sh"]