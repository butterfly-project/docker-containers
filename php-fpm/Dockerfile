FROM php:7.1-fpm

RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

ENV PINBA_ENABLED   0
ENV PINBA_SERVER    pinba

WORKDIR /var/www/html

RUN apt-get update; \
  apt-get install -y \
    gettext-base \
    libmagickwand-dev \
    libicu-dev \
    libmcrypt-dev \
    libpq-dev; \
  yes "" | pecl install imagick; \
  yes "" | pecl install redis; \
  yes "" | pecl install igbinary; \
  docker-php-ext-enable \
    imagick \
    redis \
    igbinary; \
  docker-php-ext-install -j$(nproc) \
    mbstring \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    mysqli \
    exif \
    gettext \
    intl \
    mcrypt; \
  curl -LO https://github.com/tony2001/pinba_extension/archive/RELEASE_1_1_0.tar.gz; \
  tar xzf RELEASE_1_1_0.tar.gz; \
  cd pinba_extension-RELEASE_1_1_0; \
  phpize; \
  ./configure --enable-pinba; \
  make install; \
  cd ..; \
  rm -Rf RELEASE_1_1_0.tar.gz pinba_extension-RELEASE_1_1_0; \
  apt-get clean; \
  rm -rf /var/lib/apt/lists/*; \
  rm -rf /var/cache/apk/*; \
  ln -s /usr/local/etc/config/php.ini /usr/local/etc/php/php.ini; \
  rm -f /usr/local/etc/php-fpm.d/www.conf; \
  ln -s /usr/local/etc/config/www.conf /usr/local/etc/php-fpm.d/www.conf; \
  mkdir -p /var/www/html; \
  chown www-data:www-data /var/www/html

ADD ./docker-php-ext-pinba.ini.template /usr/local/etc/docker-php-ext-pinba.ini.template

CMD ["/bin/bash", "-c", "envsubst < /usr/local/etc/docker-php-ext-pinba.ini.template > /usr/local/etc/php/conf.d/docker-php-ext-pinba.ini && php-fpm"]
