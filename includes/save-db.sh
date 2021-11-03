#!/bin/bash
source includes/core.sh
:: "Start"
rm magento.sql.gz
warden env exec -T php-fpm n98-magerun db:dump -c gzip magento
:: "Finished."
