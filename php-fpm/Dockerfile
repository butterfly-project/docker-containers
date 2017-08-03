FROM php:7.1.7-fpm

RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
        && apt-get install -y \
           libmagickwand-dev \
           libicu-dev \
           libmcrypt-dev \

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
           mysqli \
           exif \
           gettext \
           intl \
           mcrypt \

        && rm -rf /var/cache/apk/*

RUN ln -s /usr/local/etc/config/php.ini /usr/local/etc/php/php.ini \

        && rm -f /usr/local/etc/php-fpm.d/www.conf \
        && ln -s /usr/local/etc/config/www.conf /usr/local/etc/php-fpm.d/www.conf

COPY ./start.sh /var/www
RUN chmod +x /var/www/start.sh

CMD ["/var/www/start.sh"]
