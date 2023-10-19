FROM debian:buster

# Install Python3 and copy files
RUN apt-get update && \
	apt-get install -y python3 && \
	mkdir -p /app

RUN apt clean
COPY ./srcs /app
WORKDIR /app

EXPOSE 80

# Start HTTP server
CMD ["python3", "app.py"]
