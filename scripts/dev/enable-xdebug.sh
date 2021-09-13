#!/bin/bash

# Start PHP container.
docker-compose start php

# Install Xdebug PHP Library for debugging purposes.
docker exec -it youzful_php pecl install xdebug

# Enable Xdebug library.
docker exec -it youzful_php docker-php-ext-enable xdebug

# Add Xdebug configuration to enable xdebug listeners.
docker exec -it youzful_php sh -c 'grep -q "Xdebug" /usr/local/etc/php/php.ini; [ $? -eq 0 ] \
                                    && echo "Xdebug configuration is already there" && exit || echo "Adding Xdebug Configuration" \
                                    && cat <<EOT >> /usr/local/etc/php/php.ini

[Xdebug];
xdebug.remote_autostart= On;
xdebug.remote_enable=1;
xdebug.remote_connect_back=1;
xdebug.default_enable= true;
xdebug.remote_port= 9000;
xdebug.idekey= PHPSTORM;
xdebug.max_nesting_level= 256;
xdebug.remote_log= "/tmp/xdebug.log";
'

# Restart PHP container.
docker-compose restart php

# Display php version containing Xdebug information.
docker exec -it youzful_php php -v

# The next step is to configure your IDE (i.e : PhpStorm) to listen Xdebug connexions.
