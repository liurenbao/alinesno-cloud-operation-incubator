#!/bin/sh
#set -eux

echo "*** Importing Schema"

mysql -uroot -p${MYSQL_ROOT_PASSWORD} --verbose <<-EOSQL
USE mysql ;

DROP DATABASE IF EXISTS test ;

SET GLOBAL innodb_file_format=Barracuda ;

USE zipkin;
SOURCE /docker-entrypoint-initdb.d/zipkin.schema ;

EOSQL

echo "*** Image build complete"
