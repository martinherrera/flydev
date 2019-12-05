FROM php:7.2-apache

RUN apt-get update && \
    apt-get install git -y && \
    apt-get install libjpeg-dev -y && \
    apt-get install libpng-dev -y && \
    apt-get install -y sqlite3 && \
    apt-get install libsqlite3-dev -y && \
    apt-get install -y libxml2-dev && \
    docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install pdo pdo_mysql pdo_sqlite mysqli mbstring tokenizer xml ctype json gd intl zip

RUN apt-get install -y git-core curl build-essential openssl libssl-dev
RUN apt-get install -y lsb-release gnupg

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update 
RUN apt-get install -y nodejs 

RUN node --version
RUN npm -v

RUN curl -sS https://getcomposer.org/installer | php -- \
--install-dir=/usr/bin --filename=composer

EXPOSE 8000 8080
