FROM phpdockerio/php:8.2-cli

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
    cron \
    rsyslog \
    mysql-client \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

ADD ./php.ini /etc/php/8.2/fpm/conf.d/90-php.ini
ADD ./php.ini /etc/php/8.2/cli/conf.d/90-php.ini

# CRON
RUN set -ex \
    && mkfifo --mode 0666 /var/log/cron.log \
    && sed --regexp-extended --in-place \
    's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' \
    /etc/pam.d/cron

#ADD default.cron /etc/cron.d/default
ADD default.cron /var/spool/cron/crontabs/root
#RUN chmod 0644 /etc/cron.d/default
RUN chmod 0644 /var/spool/cron/crontabs/root

RUN touch /var/log/cron.log
RUN usermod -u 1000 www-data

CMD cron && tail -f /var/log/cron.log