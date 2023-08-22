FROM phpdockerio/php:8.2-fpm

ADD local /etc/apt/apt.conf.d/local

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php8.2-memcached \
    php8.2-memcache \
    php8.2-mysql \
    php8.2-intl \
    php8.2-interbase \
    php8.2-gd \
    php8.2-imagick \
    php8.2-mcrypt \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

ADD ./php.ini /etc/php/8.2/fpm/conf.d/90-php.ini
ADD ./php.ini /etc/php/8.2/cli/conf.d/90-php.ini

RUN usermod -u 1000 www-data

EXPOSE 9000