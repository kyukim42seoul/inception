#!/bin/bash

<<<<<<< Updated upstream
cp -rp data/mysql.cnf etc/mysql/conf.d/
cp -rp mariadb.cnf etc/mysql
=======
mv mysql.cnf etc/mysql/conf.d/
>>>>>>> Stashed changes
service mysql start
mysql < db.sql
service mysql stop
cp -rp my.cnf etc/mysql/
mysqld
