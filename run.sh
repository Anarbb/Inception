docker build -t nginx-image srcs/nginx
docker run -d -p 443:443 --name nginx-container nginx-image
