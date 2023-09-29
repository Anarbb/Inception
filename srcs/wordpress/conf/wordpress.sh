#!/bin/sh
if [ -f ./wp-config.php ]
then
    echo "WordPress is already installed."
else
    wget https://wordpress.org/latest.zip
    if [ $? -ne 0 ]; then
        echo "Error: Unable to download WordPress."
        exit 1
    fi

    unzip latest.zip
    if [ $? -ne 0 ]; then
        echo "Error: Unable to unzip WordPress."
        rm -rf latest.zip
        exit 1
    fi

    rm -rf latest.zip
    mv wordpress/* /var/www/html/
    rm -rf wordpress

    sed -i "s/username_here/$MYSQL_USER/g" ./wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" ./wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" ./wp-config-sample.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" ./wp-config-sample.php
    cp /var/www/html/wp-config-sample.php ./wp-config.php

    echo "WordPress installation completed."
fi

exec "$@"
