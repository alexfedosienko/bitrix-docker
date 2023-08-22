FROM phpdockerio/php:7.4-cli

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
    cron \
    rsyslog \
    mysql-client \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

ADD ./php.ini /etc/php/7.4/fpm/conf.d/90-php.ini
ADD ./php.ini /etc/php/7.4/cli/conf.d/90-php.ini

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




