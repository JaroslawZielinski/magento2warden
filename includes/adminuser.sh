#!/bin/bash
source includes/core.sh
warden env exec -u root -T php-fpm bash -c "n98-magerun admin:user:change-password ${ADMIN_USER} ${ADMIN_PASS}"
