FROM debian:buster

RUN apt-get update && \
	apt-get install -y vsftpd nano

CMD ["vsftpd", "/etc/vsftpd.conf"]

# command to build: docker build -t vsftpd .
# command to run: docker run -it --rm -p 21:21 -p 21000-21010:21000-21010 vsftpd