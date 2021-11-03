#!/bin/bash
source includes/core.sh
warden env exec -u root -T php-fpm bash -c "sudo chown www-data:www-data -R /var/www/html/data"
warden env exec -u root -T php-fpm bash -c "sudo chmod 777 -R /var/www/html/data"
:: "Fixed Db Permissions."

