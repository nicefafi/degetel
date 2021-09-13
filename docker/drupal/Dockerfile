ARG DRUPAL_VERSION
ARG COMPOSER_VERSION

FROM drupal:${DRUPAL_VERSION}

RUN apt-get update \
    && apt-get install -y git \
    && apt-get install -y unzip \
    && apt-get install -y mariadb-client


ENV OPCACHE_ENABLE=1;

RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN { \
        echo 'error_reporting  =  E_ALL'; \
        echo 'log_errors = On'; \
        echo 'memory_limit = 1G'; \
        echo 'upload_max_filesize = 1G'; \
        echo 'post_max_size = 1G'; \
        echo 'display_errors = Off'; \
        echo 'max_execution_time = 600'; \
        echo 'max_input_time = 600'; \
    } > /usr/local/etc/php/php.ini
# Unsecure but apache need to be started as root. On the host, root is already mapped with another user
RUN usermod -a -G root www-data
RUN rm -rf /var/www/html

#RUN docker-php-ext-install mysql
RUN docker-php-ext-install mysqli
# Composer installation
#RUN curl -o /home/composer.phar https://getcomposer.org/download/1.10.8/composer.phar
#COPY composer.sh /bin/composer
#RUN chmod +x /bin/composer
ENV COMPOSER_HOME=/root/.composer
RUN mkdir -p $COMPOSER_HOME \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#COPY new-install.sh /bin/new-install
#RUN chmod +x /bin/new-install

#COPY dump_prod.sh /bin/dump_prod
#RUN chmod +x /bin/dump_prod

#COPY ./../../html /var/www/html

WORKDIR /var/www/
ENV drush=/var/www/vendor/bin/drush
ENV drupal=/var/www/vendor/bin/drupal
ENV phing=/var/www/vendor/bin/phing
#RUN export HTTPS_PROXY_REQUEST_FULLURI=false \
#    && composer install
