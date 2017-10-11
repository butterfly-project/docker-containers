FROM debian:latest

RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

COPY TexturePacker-4.5.0-ubuntu64.deb /tmp/TexturePacker.deb

RUN apt update \
        && apt install -y \
                libglu1-mesa \
                libglib2.0-0 \
        && rm -rf /var/cache/apk/* \
        && dpkg -i /tmp/TexturePacker.deb \
        && rm -rf /tmp/TexturePacker.deb \
        && echo 'agree' | TexturePacker --license-info

WORKDIR /usr/src/app

ENTRYPOINT [ \
  "TexturePacker", \
  "--algorithm", "Basic", \
  "--png-opt-level", "0", \
  "--disable-auto-alias", \
  "--extrude", "0", \
  "--trim-mode", "None", \
  "--format", "json", \
  "--data" \
  ]
