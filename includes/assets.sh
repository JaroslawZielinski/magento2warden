#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bin/magento setup:static-content:deploy -f en_US
warden env exec -T php-fpm bin/magento cache:clean
warden env exec -T php-fpm bin/magento cache:flush
:: "Finished."
