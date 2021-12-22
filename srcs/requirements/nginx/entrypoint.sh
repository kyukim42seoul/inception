#!/bin/bash

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/0=42Seoul/OU=Kyukim/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt

mv localhost.dev.crt etc/ssl/certs/
mv localhost.dev.key etc/ssl/private/
chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

mv default etc/nginx/sites-available/
service nginx start
