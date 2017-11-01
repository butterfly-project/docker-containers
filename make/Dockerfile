FROM debian:latest

RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN apt update; \
  apt install -y make; \
  rm -rf /var/cache/apk/*; \
  mkdir -p /var/app

WORKDIR /var/app
