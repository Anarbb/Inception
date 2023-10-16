FROM debian:buster

RUN apt-get update && \
	apt-get install -y vsftpd nano

EXPOSE 20
EXPOSE 21
EXPOSE 21000-21010

COPY ./conf/install.bash /tmp/
COPY ./conf/vsftpd.conf /etc/
RUN chmod +x /tmp/install.bash

ENTRYPOINT [ "/tmp/install.bash" ]

CMD ["vsftpd", "/etc/vsftpd.conf"]

# command to build: docker build -t vsftpd .
# command to run: docker run -it --rm -p 21:21 -p 21000-21010:21000-21010 vsftpd