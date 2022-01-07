#!/bin/bash

FILE=/var/lib/mysql/temp/db.sql
cp -rp data/mysql.cnf etc/mysql/conf.d/
cp -rp mariadb.cnf etc/mysql
cp -rp my.cnf etc/mysql/
if [ ! -e "$FILE" ]; then
	service mysql start
	mysql < db.sql
	service mysql stop
	mkdir var/lib/mysql/temp
	mv db.sql var/lib/mysql/temp/db.sql
fi
mysqld
