FROM php:5.6.38-apache-jessie
MAINTAINER Sergio Felix <sergiofelix16@gmail.com>

RUN apt-get update
RUN apt-get install -y libpq-dev libxml2-dev
RUN apt-get install libpng12-dev libfreetype6-dev -y

# Set locales
RUN apt-get install locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen 
RUN echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "it_IT.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen

RUN docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-install soap
RUN docker-php-ext-install mysql
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install gd
RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
COPY php.ini /usr/local/etc/php/php.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Install npm
#RUN apt-get update -y && apt-get install curl -y && curl -sL https://deb.nodesource.com/setup_10.x && apt clean -y
#RUN apt-get install nodejs npm -y
