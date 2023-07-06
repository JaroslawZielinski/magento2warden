#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bin/magento setup:upgrade
warden env exec -T php-fpm bin/magento setup:di:compile
warden env exec -T php-fpm bin/magento setup:static-content:deploy -f en_US fr_FR
warden env exec -T php-fpm bin/magento indexer:reindex design_config_grid customer_grid catalog_category_product catalog_product_category catalogrule_rule catalog_product_attribute cataloginventory_stock inventory catalogrule_product catalog_product_price catalogsearch_fulltext
warden env exec -T php-fpm bin/magento cache:clean
warden env exec -T php-fpm bin/magento cache:flush
:: "Finished."
