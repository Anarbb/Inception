# Use the Debian Buster as the base image
FROM debian:buster

RUN apt-get update && apt-get install -y \
    curl \
    git

RUN mkdir -p /tmp/hugo && \
    cd /tmp/hugo && \
    curl -LO https://github.com/gohugoio/hugo/releases/download/v0.119.0/hugo_0.119.0_linux-amd64.tar.gz && \
    tar -zxvf hugo_0.119.0_linux-amd64.tar.gz && \
    mv hugo /usr/local/bin/hugo && \
    rm -rf /tmp/hugo

RUN apt-get clean

RUN mkdir -p /app/blog

WORKDIR /app/blog

RUN hugo new site /app/blog \
    && cd /app/blog \
    && git init \
    && git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke

RUN hugo new content posts/my-first-post.md

RUN echo "Hello World" >> /app/blog/content/posts/my-first-post.md

COPY ./conf/config.toml /app/blog/hugo.toml

EXPOSE 1313
CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://localhost/blog", \
         "-p", "1313", \
          "--appendPort=false", \
          "--buildDrafts"]
