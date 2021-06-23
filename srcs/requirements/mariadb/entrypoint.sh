#!/bin/bash

mv data/mysql.cnf etc/mysql/conf.d/
service mysql start
mysql < db.sql
service mysql stop
mysqld
