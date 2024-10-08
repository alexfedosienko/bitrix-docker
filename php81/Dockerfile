FROM phpdockerio/php:8.1-fpm

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php8.1-gd \
    php8.1-imagick \
    php8.1-intl \
    php8.1-interbase \
    php8.1-mbstring \
    php8.1-mcrypt \
    php8.1-memcache \
    php8.1-memcached \
    php8.1-mysql \
    php8.1-opcache \
    php8.1-soap \
    php8.1-zip \
    cron \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY ./php.ini /etc/php/8.1/fpm/conf.d/90-php.ini
COPY ./php.ini /etc/php/8.1/cli/conf.d/90-php.ini

COPY ./bitrix.cron /etc/cron.d/bitrix
RUN chmod 0644 /etc/cron.d/bitrix
RUN crontab /etc/cron.d/bitrix
RUN touch /var/log/cron.log

RUN usermod -u 1000 www-data

WORKDIR "/var/www/public"

EXPOSE 9000