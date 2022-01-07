FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN apt-get install -y openssl
RUN apt-get install -y nginx
RUN apt-get install openssl
COPY entrypoint.sh /entrypoint.sh
COPY conf/default_test_ssl /default
RUN chmod +x /entrypoint.sh
RUN echo "\ndaemon off;" >> etc/nginx/nginx.conf
RUN mkdir /var/www/wordpress

#EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
