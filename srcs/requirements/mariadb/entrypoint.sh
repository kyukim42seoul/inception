#!/bin/bash

echo "Hello"
service mysql start
mysql < db.sql
mysqld
echo "Done"
