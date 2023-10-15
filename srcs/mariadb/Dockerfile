# Use the official Debian base image
FROM debian:buster
LABEL org.opencontainers.image.repository="mariadb"


# Install MariaDB Server
RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./config/mysqld.cnf /etc/mysql/mariadb.conf.d/mysqld.cnf

# Expose MariaDB port
EXPOSE 3306

COPY ./scripts/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT [ "/setup.sh" ]


# You can also use the following CMD to run MariaDB in the foreground if needed:
CMD ["mysqld", "--bind-address=0.0.0.0"]

