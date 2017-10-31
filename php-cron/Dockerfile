FROM agregad/php-cli
RUN apt update \
  && apt install -y cron \
  && rm -rf /var/cache/apk/* \
  && touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log

