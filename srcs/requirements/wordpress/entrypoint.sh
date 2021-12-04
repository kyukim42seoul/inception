#!/bin/bash

tar -xvf latest.tar.gz
cp -rp wordpress WordPress
rm -rf wordpress
mv wp-config.php /WordPress/wordpress/
mv www.conf etc/php/7.3/fpm/pool.d/
mv php.ini /etc/php/7.3/cli/
chown -R www-data:www-data /WordPress
php-fpm7.3 -F -R
