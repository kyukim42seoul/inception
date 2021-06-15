#!/bin/bash

tar -xvf latest.tar.gz
mv wordpress WordPress
mv wp-config.php /WordPress/wordpress/
mv www.conf etc/php/7.3/fpm/pool.d/
chown -R nginx:nginx /WordPress
php-fpm7.3 -F -R
