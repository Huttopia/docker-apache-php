FROM php:5.4-apache

RUN apt-get update -qq \
    && apt-get install -qy --force-yes \
    git \
    zlib1g-dev \
    && docker-php-ext-install mysql \
    && docker-php-ext-configure mysql \
    && docker-php-ext-install zip \
    && docker-php-ext-configure zip

COPY config/php.ini /usr/local/etc/php/
