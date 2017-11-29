FROM debian:latest

COPY Spine-64bit.tar.gz /tmp/spine.tar.gz

RUN cd /tmp; \
  tar xzf spine.tar.gz; \
  mv Spine /usr/local/lib/; \
  ln -s /usr/local/lib/Spine/Spine.sh /usr/local/bin/spine

COPY Spine.sh /usr/local/lib/Spine/Spine.sh

WORKDIR /usr/src/app

ENTRYPOINT [ "spine" ]
