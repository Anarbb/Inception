#!/bin/sh
if [ -f ./wp-config.php ]
then
    echo "WordPress is already installed."
else
    curl -O https://wordpress.org/latest.zip > /dev/null
    if [ $? -ne 0 ]; then
        echo "Error: Unable to download WordPress."
        exit 1
    fi

    unzip latest.zip > /dev/null
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
    chown -R www-data:www-data /var/www/html
    wp core install --allow-root --url="$SITE_URL" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PW" --admin_email="$ADMIN_EMAIL"
    wp user create $USER $USER_EMAIL --role=$USER_ROLE --user_pass=$USER_PW --allow-root
    wp plugin install redis-cache --activate --allow-root
    # enable object cache
    wp config set WP_REDIS_HOST "$REDIS_HOSTNAME" --raw --type=constant --allow-root
    wp config set WP_REDIS_PORT "$REDIS_PORT" --raw --type=constant --allow-root
    wp config set WP_CACHE true --raw --type=constant --allow-root
    wp redis enable --allow-root --force
fi

exec "$@"
