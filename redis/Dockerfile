FROM redis:alpine

RUN apk add --update tzdata \
        && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
        && echo "Europe/Moscow" >  /etc/timezone \
        && apk del tzdata
