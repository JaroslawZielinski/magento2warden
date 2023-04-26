#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bin/magento torahverse:module:uninstall
warden env exec -T php-fpm composer clearcache
warden env exec -T php-fpm composer require jaroslawzielinski/torahverse-m2
warden env exec -T php-fpm composer require --dev jaroslawzielinski/diagnostics-m2
warden env exec -T php-fpm composer require --dev jaroslawzielinski/magento2warden
:: "Finished."
