FROM debian:latest

RUN apt update; \
  apt install -y pngquant; \
  rm -rf /var/cache/apk/*

WORKDIR /usr/src/app
