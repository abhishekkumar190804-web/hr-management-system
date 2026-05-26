#!/bin/bash

set -e

echo "Starting MySQL..."

service mysql start

echo "Waiting for MySQL..."

until mysqladmin ping --silent; do
    sleep 2
done

echo "Configuring Database..."

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"

mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS hr_dev_db;"

if [ -f /app/hr_schema_data_db.sql ]; then
    mysql -u root -proot hr_dev_db < /app/hr_schema_data_db.sql
fi

echo "Starting Spring Boot..."

exec java \
    -Xms128m \
    -Xmx512m \
    -XX:+UseSerialGC \
    -jar app.jar