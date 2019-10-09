FROM php:5.6.38-apache-jessie
MAINTAINER Sergio Felix <sergiofelix16@gmail.com>

RUN apt-get update
RUN apt-get install -y libpq-dev libxml2-dev
RUN apt-get install libpng12-dev libfreetype6-dev -y
RUN docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-install soap
RUN docker-php-ext-install mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
COPY php.ini /usr/local/etc/php/php.ini
