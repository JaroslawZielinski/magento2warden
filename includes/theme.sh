#!/bin/bash
source includes/core.sh
:: "Start"
SED=`which sed`
source includes/dbip.sh
$SED -i "s/^\(HOST\s*=\s*\).*\$/\1$mysqlIP/" dbtests/config.env
warden env exec -T php-fpm bin/magento setup:upgrade
warden env exec -T php-fpm bin/magento setup:di:compile
warden env exec -T php-fpm bin/magento setup:static-content:deploy -f en_US # pl_PL
warden env exec -T php-fpm bin/magento indexer:reindex
#warden env exec -T php-fpm bin/magento indexer:reindex design_config_grid
#warden env exec -T php-fpm bin/magento indexer:reindex customer_grid
##catalog search
#warden env exec -T php-fpm bin/magento indexer:reindex catalog_category_product
#warden env exec -T php-fpm bin/magento indexer:reindex catalog_product_category
##catalog search
#warden env exec -T php-fpm bin/magento indexer:reindex catalogrule_rule
#warden env exec -T php-fpm bin/magento indexer:reindex catalog_product_attribute
##catalog search
#warden env exec -T php-fpm bin/magento indexer:reindex cataloginventory_stock
##catalog search
#warden env exec -T php-fpm bin/magento indexer:reindex inventory
#warden env exec -T php-fpm bin/magento indexer:reindex catalogrule_product
##catalog search
#warden env exec -T php-fpm bin/magento indexer:reindex catalog_product_price
##catalog search
#warden env exec -T php-fpm bin/magento indexer:reindex catalogsearch_fulltext
warden env exec -T php-fpm bin/magento cache:clean
warden env exec -T php-fpm bin/magento cache:flush
:: "Finished."
