#!/bin/bash

cp -rp data/mysql.cnf etc/mysql/conf.d/
cp -rp mariadb.cnf etc/mysql
service mysql start
mysql < db.sql
service mysql stop
cp -rp my.cnf etc/mysql/
mysqld
