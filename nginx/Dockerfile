FROM nginx

RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

ENV NGINX_WORKER_PROCESSES    1
ENV NGINX_WORKER_CONNECTIONS  1024

ADD ./include /etc/nginx/include
ADD ./nginx.conf.template /etc/nginx/nginx.conf.template

CMD ["/bin/bash", "-c", "envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]
