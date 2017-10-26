FROM php:7.1.7-cli

RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
        && apt-get install -y \
           libmagickwand-dev \
           libicu-dev \
           libmcrypt-dev \
           libpq-dev \
        && yes "" | pecl install imagick \
        && yes "" | pecl install redis \
        && yes "" | pecl install igbinary \
        && docker-php-ext-enable \
           imagick \
           redis \
           igbinary \
        && docker-php-ext-install -j$(nproc) \
           mbstring \
           opcache \
           pdo_mysql \
           pdo_pgsql \
           mysqli \
           exif \
           gettext \
           intl \
           mcrypt \
        && rm -rf /var/cache/apk/*

RUN ln -s /usr/local/etc/config/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html

CMD ["bash"]
