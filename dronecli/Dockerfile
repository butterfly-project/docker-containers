FROM debian AS build-curl
WORKDIR /tmp
RUN apt update \
  && apt install -y curl \
  && curl -L https://github.com/drone/drone-cli/releases/download/v0.7.0/drone_linux_amd64.tar.gz | tar zx


FROM debian
COPY --from=build-curl /tmp/drone /tmp/drone
RUN cd /tmp \
  && install -t /usr/local/bin drone \
  && rm /tmp/drone
ENTRYPOINT ["drone"]
