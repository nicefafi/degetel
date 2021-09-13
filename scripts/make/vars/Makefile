.EXPORT_ALL_VARIABLES:

UID=$(shell id -un)
GROUP=$(shell id -gn)

# project
PWD=$(shell pwd)
PROJ_ROOT=${PWD}
D8_DIR=html
D8_ROOT=${PROJ_ROOT}/${D8_DIR}

# composer
COMPOSR=${PROJ_ROOT}/composer.phar
COMPOSER_MEMORY_LIMIT=-1

# docker
DOCKER=jw_php_1
DOCKER_EXEC=docker exec -t ${DOCKER}
DOCKER_HOME=/var/www
DOCKER_DOCROOT=${DOCKER_HOME}/${D8_DIR}

# bins
BINDIR=${D8_ROOT}/bin
DOCKER_BIN=${DOCKER_DOCROOT}/bin
DRUSH=${DOCKER_BIN}/drush --root=${DOCKER_DOCROOT}
CONSOLE=${DOCKER_BIN}/drupal --root=${DOCKER_DOCROOT}

# vendor
VENDOR_DIR=${PROJ_ROOT}/vendor

# drupal
MODULE_CONTRIB=${D8_ROOT}/modules/contrib
MODULE_CUSTOM=${D8_ROOT}/modules/custom
THEME_CONTRIB=${D8_ROOT}/themes/contrib
THEME_CUSTOM=${D8_ROOT}/themes/custom
D8_SITE=${D8_ROOT}/sites/default
UUID=56ea0e50-d2ce-4d9f-bc94-4bd097a263d1
