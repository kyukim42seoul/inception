FROM	debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN	apt-get install -y curl
RUN	apt-get install -y php-fpm
RUN	apt-get install -y php7.3-mysqli
COPY entrypoint.sh /entrypoint.sh
COPY wp-config.php /wp-config.php
#COPY WordPress/php.ini /php.ini
COPY www.conf /www.conf
RUN chmod +x /entrypoint.sh
#mkdir -p 옵션은 부모 디렉토리와 자식 디렉토리를 같이 생성
RUN mkdir -p /run/php


ENTRYPOINT [ "/entrypoint.sh"]
