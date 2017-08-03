#!/bin/bash

docker build -t agregad/mysql mysql/
docker build -t agregad/nginx nginx/
docker build -t agregad/php-cli php-cli/
docker build -t agregad/php-fpm php-fpm/
docker build -t agregad/redis redis/
