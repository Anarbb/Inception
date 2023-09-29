FROM debian:latest

RUN apt-get update

# download php-fpm
RUN apt-get install -y php-fpm wget curl unzip php-mysql php-xml php-mbstring php-zip php-gd php-curl php-imagick

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/
# install wordpress
COPY conf/wordpress.sh /wordpress.sh
RUN chmod +x /wordpress.sh
ENTRYPOINT [ "/wordpress.sh" ]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8.2", "-F"]