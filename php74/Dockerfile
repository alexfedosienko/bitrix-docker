FROM phpdockerio/php:7.4-fpm

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php7.4-gd \
    php7.4-imagick \
    php7.4-intl \
    php7.4-interbase \
    php7.4-mbstring \
    php7.4-mcrypt \
    php7.4-memcache \
    php7.4-memcached \
    php7.4-mysql \
    php7.4-opcache \
    php7.4-soap \
    php7.4-zip \
    cron \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY ./php.ini /etc/php/7.4/fpm/conf.d/90-php.ini
COPY ./php.ini /etc/php/7.4/cli/conf.d/90-php.ini

COPY ./bitrix.cron /etc/cron.d/bitrix
RUN chmod 0644 /etc/cron.d/bitrix
RUN crontab /etc/cron.d/bitrix
RUN touch /var/log/cron.log

RUN usermod -u 1000 www-data

WORKDIR "/var/www/public"

EXPOSE 9000