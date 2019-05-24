FROM php:#TAG#
MAINTAINER minextu

# install build dependencies
RUN apt-get update                             && \
    apt-get install -y --no-install-recommends    \
        git                                       \
        openssh-client                            \
        wget                                      \
        zlib1g-dev                                \
        libzip-dev                             && \
    rm -rf /var/lib/apt/lists/*
    

# install php extensions
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip
RUN pecl install xdebug && docker-php-ext-enable xdebug

# set timezone
RUN echo "[Date]" >> /usr/local/etc/php/php.ini && \
    echo "date.timezone = UTC" >> /usr/local/etc/php/php.ini

# Install phpunit
RUN curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-8.phar &&\
    chmod +x /usr/local/bin/phpunit

# install composer
RUN wget https://composer.github.io/installer.sig -O - -q | tr -d '\n' > installer.sig && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"          && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === file_get_contents('installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer            && \
    php -r "unlink('composer-setup.php'); unlink('installer.sig');"
