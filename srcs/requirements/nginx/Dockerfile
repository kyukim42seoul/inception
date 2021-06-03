FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN apt-get install -y nginx
COPY entrypoint.sh /entrypoint.sh
COPY conf/default /default
RUN chmod +x /entrypoint.sh
RUN echo "\ndaemon off;" >> etc/nginx/nginx.conf
RUN mkdir WordPress

#EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
