#!/bin/bash

# Start PHP container.
docker-compose start php

# Move xdebug ini file to disable it.
docker exec -it youzful_php sh -c 'cd /usr/local/etc/php/conf.d/ && mkdir -p disabled && mv docker-php-ext-xdebug.ini disabled'

# Restart PHP container.
docker-compose restart php

# Display php version containing Xdebug information.
docker exec -it youzful_php php -v
