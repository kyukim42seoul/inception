#!/bin/bash

chown -R kyukim /var/lib/mysql
cp -rp data/mysql.cnf etc/mysql/conf.d/
cp -rp mariadb.cnf etc/mysql
cp -rp my.cnf etc/mysql/
service mysql start
mysql < db.sql
service mysql stop
mkdir var/lib/mysql/wordpress
mysqld
