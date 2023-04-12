#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm composer clearcache
mysqlIP=$(docker inspect --format "{{with index .NetworkSettings.Networks \"${WARDEN_ENV_NAME}_default\"}}{{.IPAddress}}{{end}}" ${WARDEN_ENV_NAME}_db_1)
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'DELETE FROM core_config_data WHERE path LIKE "%jaroslawzielinski_torahverse%";'
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'DELETE FROM layout_update WHERE xml LIKE "%TorahVerse%";'
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'DELETE FROM patch_list WHERE patch_name LIKE "%TorahVerse%";'
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'DROP table torahverse_quotes;'
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'DROP table torahverse_verses;'
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'DROP table torahverse_groups;'
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'DELETE FROM ui_bookmark WHERE namespace LIKE "%jaroslawzielinski_torahverse%";'
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'DELETE FROM widget_instance WHERE instance_type LIKE "%TorahVerse%";'
warden env exec -T php-fpm composer require jaroslawzielinski/torahverse-m2
warden env exec -T php-fpm composer require --dev jaroslawzielinski/diagnostics-m2
warden env exec -T php-fpm composer require --dev jaroslawzielinski/magento2warden
:: "Finished."
