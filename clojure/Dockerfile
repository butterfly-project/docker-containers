FROM clojure

RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

WORKDIR /usr/src/app

CMD ["lein", "run"]
