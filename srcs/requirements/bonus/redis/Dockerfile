FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y redis-server

COPY ./conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD [ "redis-server", "/etc/redis/redis.conf", "--daemonize no"]