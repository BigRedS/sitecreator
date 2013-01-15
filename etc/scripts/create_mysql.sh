#! /bin/bash

MYSQL="mysql --defaults-extra-file=/etc/mysql/debian.cnf "
USERNAME=$1
PASSWORD=$2

echo "create database $USERNAME" | $MYSQL

echo "grant all privileges on $USERNAME.* to $USERNAME@localhost identified by $PASSWORD" | $MYSQL

echo "flush privileges" | $MYSQL
