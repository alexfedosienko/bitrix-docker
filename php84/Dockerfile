FROM phpdockerio/php:8.4-fpm

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php8.4-gd \
    php8.4-imagick \
    php8.4-intl \
    php8.4-interbase \
    php8.4-mbstring \
    php8.4-mcrypt \
    php8.4-memcache \
    php8.4-memcached \
    php8.4-mysql \
    php8.4-opcache \
    php8.4-soap \
    php8.4-zip \
    cron \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY ./php.ini /etc/php/8.4/fpm/conf.d/90-php.ini
COPY ./php.ini /etc/php/8.4/cli/conf.d/90-php.ini

COPY ./bitrix.cron /etc/cron.d/bitrix
RUN chmod 0644 /etc/cron.d/bitrix
RUN crontab /etc/cron.d/bitrix
RUN touch /var/log/cron.log

RUN usermod -u 1000 www-data

WORKDIR "/var/www/public"

EXPOSE 9000