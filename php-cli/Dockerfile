FROM php:7.1.7-cli

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

ENTRYPOINT /bin/bash
CMD ["true"]
