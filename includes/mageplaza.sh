#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bash -c "composer clearcache && composer require mageplaza/module-smtp"
warden env exec -T php-fpm bin/magento mo:en Mageplaza_Core Mageplaza_Smtp
warden env exec -T php-fpm n98-magerun config:store:set smtp/module/active 1
warden env exec -T php-fpm bash -c "
n98-magerun config:store:set smtp/module/product_key ${MAGEPLAZA_SMTP_PRODUCT_KEY}
n98-magerun config:store:set smtp/module/email ${MAGEPLAZA_SMTP_PRODUCT_EMAIL}
n98-magerun config:store:set smtp/module/name '${MAGEPLAZA_SMTP_PRODUCT_NAME}'
"
warden env exec -T php-fpm n98-magerun config:store:set smtp/module/create 1
warden env exec -T php-fpm n98-magerun config:store:set smtp/module/subscribe 0
:: "Finished."
