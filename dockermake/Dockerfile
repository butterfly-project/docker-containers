FROM agregad/docker

WORKDIR /var/app
ENTRYPOINT ["make"]

RUN apk add --no-cache make bash; \
  mkdir -p /var/app
