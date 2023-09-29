#!/bin/bash

# Start the MySQL service
service mariadb start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else
	
# Secure the MySQL installation
mysql_secure_installation << _EOF_
Y
rootata42
rootata42
Y
n
Y
Y
_EOF_

# Grant privileges to root user
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

# Create the database and grant privileges to a user
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

echo "Database created"
fi

# Stop the MySQL service
service mariadb stop

# Execute the provided command (e.g., your application)
exec "$@"
