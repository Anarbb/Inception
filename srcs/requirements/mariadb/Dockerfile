# Use the official Debian base image
FROM debian:buster

# Install MariaDB Server
RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./config/mysqld.cnf /etc/mysql/mariadb.conf.d/mysqld.cnf

# Expose MariaDB port
EXPOSE 3306

COPY ./scripts/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT [ "/setup.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]
