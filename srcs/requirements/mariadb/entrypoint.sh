#!/bin/bash

cp -rp my.cnf etc/mysql/
service mysql start
mysql < db.sql
service mysql stop
mysqld
