#!/bin/bash

FILE=/var/lib/mysql/temp/db.sql
if [ ! -e "$FILE" ]; then
	cp -rp data/mysql.cnf etc/mysql/conf.d/
	cp -rp mariadb.cnf etc/mysql
	service mysql start
	mysql < db.sql
	mv db.sql var/lib/mysql/temp/db.sql
	service mysql stop
	cp -rp my.cnf etc/mysql/
fi
mysqld
