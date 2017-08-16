FROM node:8

RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

WORKDIR /usr/src/app

RUN npm i -g babel-cli
