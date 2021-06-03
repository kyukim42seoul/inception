#!/bin/bash

tar -xvf latest.tar.gz
mv wordpress WordPress
mv wp-config.php /WordPress/wordpress/
php-fpm7.3 -F -R
