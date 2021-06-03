#!/bin/bash
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/0=42Seoul/OU=Kyukim/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt

mv localhost.dev.crt etc/ssl/certs/
mv localhost.dev.key etc/ssl/private/
chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz
tar -xvf latest.tar.gz

mv phpMyAdmin-5.1.0-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
mv wordpress /var/www/html/

mv /srcs/config.inc.php var/www/html/phpmyadmin/config.inc.php
mv /srcs/default /etc/nginx/sites-available/
mv /srcs/wp-config.php /var/www/html/wordpress/

chown -R www-data:www-data /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/phpmyadmin

service nginx start
service mysql start

mysql < srcs/db.sql

service php7.3-fpm start

bash
