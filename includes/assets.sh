#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bin/magento setup:upgrade
warden env exec -T php-fpm bin/magento setup:di:compile
warden env exec -T php-fpm bin/magento setup:static-content:deploy -f en_US fr_FR de_DE it_IT
warden env exec -T php-fpm bin/magento indexer:reindex design_config_grid
warden env exec -T php-fpm bin/magento indexer:reindex customer_grid
warden env exec -T php-fpm bin/magento cache:clean
warden env exec -T php-fpm bin/magento cache:flush
:: "Finished."
