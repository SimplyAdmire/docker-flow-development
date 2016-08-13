FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/http:\/\/nl./http:\/\//g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y php7.0-fpm php7.0-cli
RUN apt-get install -y \
    php7.0-mbstring php7.0-mysql php7.0-pgsql php7.0-zip \
    php7.0-ldap php7.0-curl php7.0-xml php7.0-soap php7.0-gd

RUN apt-get install -y graphicsmagick
RUN apt-get install -y curl

RUN mkdir -p /run/php

RUN apt-get install -y ssmtp

RUN apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    echo -n > /var/lib/apt/extended_states && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/man/?? && \
    rm -rf /usr/share/man/??_*

RUN usermod -u 1000 www-data

CMD ["-"]