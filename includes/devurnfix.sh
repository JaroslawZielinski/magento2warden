#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bin/magento dev:urn-catalog:generate .idea/misc.xml
:: "Finished."
