#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bash -c "bin/magento cache:clean && bin/magento cache:flush"
:: "Finished."
