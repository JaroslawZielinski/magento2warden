#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bash -c "php -d memory_limit=-1 bin/magento sampledata:deploy -vvv"
:: "Finished."
