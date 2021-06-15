#!/bin/bash

echo "Hello"
service mysql start
mysql < db.sql
service mysql stop
mysqld
