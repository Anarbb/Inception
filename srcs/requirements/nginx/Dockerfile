FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/certs
RUN mkdir -p /etc/nginx/ssl/private

RUN openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out /etc/nginx/ssl/certs/cert.crt \
            -keyout /etc/nginx/ssl/private/priv.key \
            -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/OU=1337KH/CN=aarbaoui.42.fr"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
