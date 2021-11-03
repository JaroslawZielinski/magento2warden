#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bin/magento setup:upgrade
warden env exec -T php-fpm bin/magento setup:di:compile
warden env exec -T php-fpm bin/magento setup:static-content:deploy -f
warden env exec -T php-fpm bin/magento setup:static-content:deploy -f en_US
warden env exec -T php-fpm bin/magento setup:static-content:deploy -f fr_FR
warden env exec -T php-fpm bin/magento indexer:reindex
warden env exec -T php-fpm bin/magento cache:clean
warden env exec -T php-fpm bin/magento cache:flush
:: "Finished."
