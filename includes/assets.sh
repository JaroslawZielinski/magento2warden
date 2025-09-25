#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bin/magento setup:static-content:deploy -f en_US # pl_PL
:: "Finished."
