FROM debian:buster

LABEL org.opencontainers.image.repository="wordpress"

RUN apt-get update

# download php-fpm
RUN apt-get install -y php-fpm wget curl unzip php-mysql php-xml php-mbstring php-zip php-gd php-curl php-imagick netcat

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir -p /run/php
# install wordpress
COPY conf/wordpress.sh /wordpress.sh
RUN chmod +x /wordpress.sh
ENTRYPOINT [ "/wordpress.sh" ]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]