FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add nginx openssl --no-cache

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out /etc/nginx/ssl/cert.crt \
            -keyout /etc/nginx/ssl/priv.key \
            -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/OU=1337KH/CN=aarbaoui.42.fr"


COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
