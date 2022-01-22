#!/bin/bash

FILE=/var/lib/mysql/check.txt
#	mkdir var/lib/mysql/wordpress
#	cp -rp data/mysql.cnf etc/mysql/conf.d/
#	cp -rp mariadb.cnf etc/mysql
#	touch /var/lib/mysql/check.txt
cp -rp my.cnf etc/mysql/
service mysql start
mysql < db.sql
service mysql stop
mysqld
