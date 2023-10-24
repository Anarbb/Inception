FROM debian:buster


RUN apt update && apt install -y \
	php-fpm \
	php-mysql \
	wget


RUN mkdir -p /var/www/html/adminer
WORKDIR /var/www/html/adminer

RUN mkdir -p /var/www/html/adminer

RUN wget -qO /var/www/html/adminer/index.php https://www.adminer.org/latest.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /run/php

EXPOSE 9000	

CMD ["php-fpm7.3", "-F"]