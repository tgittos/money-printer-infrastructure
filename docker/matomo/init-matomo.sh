#!/bin/bash

MATOMO_DB_USER=matomo
MATOMO_DB_PW=matmo!QAZxsw2

touch /run/openrc/softlevel

echo "Starting nginx"
rc-service nginx restart

echo "Ensuring mysql is running"
# (rc-service mariadb start &) | grep -q
rc-service mariadb restart

echo "Creating a db user"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD --host=127.0.0.1 --execute="CREATE USER '$MATOMO_DB_USER' IDENTIFIED BY '$MATOMO_DB_PW'"

echo "Creating a new db"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD --host=127.0.0.1 --execute="CREATE SCHEMA matomo"

echo "Granting access to db to db user"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD --host=127.0.0.1 --database matomo --execute="GRANT ALL PRIVILEGES ON *.* TO '$MATOMO_DB_USER';"

echo "DB username: $MATOMO_DB_USER"
echo "DB password: $MATOMO_DB_PW"