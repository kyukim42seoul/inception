FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN service nginx start

EXPOSE 80 443

ENTRYPOINT [ "nginx", "-g", "daemon off;"]