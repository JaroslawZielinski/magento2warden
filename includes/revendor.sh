#!/bin/bash
source includes/core.sh
:: "Start"
rm -rf vendor/
warden env exec -u root -T php-fpm bash -c "composer clearcache && composer install"
warden env exec -u root -T php-fpm bash -c "chown www-data:www-data -R /var/www/html/"
:: "Finished."
