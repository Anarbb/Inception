FROM debian:latest

# Create a non-root user to run MariaDB
RUN groupadd -r mysql && useradd -r -g mysql mysql

# Install MariaDB server and clean up after installation
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=123456
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=123456

# Create necessary directories with proper permissions
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql
RUN mkdir -p /var/log/mysql && chown -R mysql:mysql /var/log/mysql
RUN chmod 777 /var/run/mysqld



# Switch to the mysql user and start MySQL service on container startup
USER mysql
CMD ["mysqld"]

# Expose the default MySQL port
EXPOSE 3306
