#!/bin/bash
source includes/core.sh
warden env exec -T php-fpm bin/magento app:config:import
elasticSearchIp=$(docker inspect --format "{{with index .NetworkSettings.Networks \"${WARDEN_ENV_NAME}_default\"}}{{.IPAddress}}{{end}}" ${WARDEN_ENV_NAME}-elasticsearch-1)
warden env exec -T php-fpm bin/magento config:set --lock-env catalog/search/elasticsearch7_server_hostname "${elasticSearchIp}"
:: $elasticSearchIp
