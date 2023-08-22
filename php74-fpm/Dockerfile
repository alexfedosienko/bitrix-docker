FROM phpdockerio/php:7.4-fpm

ADD local /etc/apt/apt.conf.d/local

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php7.4-memcached \
    php7.4-memcache \
    php7.4-mysql \
    php7.4-intl \
    php7.4-interbase \
    php7.4-gd \
    php7.4-imagick \
    php7.4-mcrypt \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

ADD ./php.ini /etc/php/7.4/fpm/conf.d/90-php.ini
ADD ./php.ini /etc/php/7.4/cli/conf.d/90-php.ini

RUN usermod -u 1000 www-data

EXPOSE 9000