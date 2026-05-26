#!/bin/bash

echo "Starting MariaDB..."

service mariadb start

echo "Waiting for MariaDB..."

until mysqladmin ping -h "localhost" --silent; do
    echo "MariaDB not ready yet..."
    sleep 2
done

echo "MariaDB ready."

echo "Creating application user..."

mysql <<EOF
CREATE USER IF NOT EXISTS 'appuser'@'localhost' IDENTIFIED BY 'apppassword';

GRANT ALL PRIVILEGES ON *.* TO 'appuser'@'localhost';

FLUSH PRIVILEGES;
EOF

echo "Importing schema..."

mysql < hr_schema_data_db.sql

echo "PORT=$PORT"

echo "Starting Spring Boot..."

exec java \
-Xms128m \
-Xmx256m \
-XX:+UseSerialGC \
-Djava.security.egd=file:/dev/./urandom \
-Dserver.port=${PORT:-10000} \
-Dserver.address=0.0.0.0 \
-jar app.jar