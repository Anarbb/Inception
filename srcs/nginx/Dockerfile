FROM alpine:latest

RUN apk update

RUN apk add nginx --no-cache

EXPOSE 80 443 22

CMD [ "nginx", "-g", "daemon off;" ]
