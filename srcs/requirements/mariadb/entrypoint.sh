#!/bin/bash

chmod 550 temp/
cp -rp temp/ var/lib/mysql/
cp -rp data/mysql.cnf etc/mysql/conf.d/
cp -rp mariadb.cnf etc/mysql
service mysql start
mysql < db.sql
service mysql stop
cp -rp my.cnf etc/mysql/
mysqld
