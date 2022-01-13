#!/bin/bash

DB=/home/kyukim/data/DB
WP=/home/kyukim/data/WordPress
if [ ! -e "$DB" ]; then
	mkdir -p /home/kyukim/data/DB
fi
if [ ! -e "$WP" ]; then
	mkdir -p /home/kyukim/data/WordPress
fi