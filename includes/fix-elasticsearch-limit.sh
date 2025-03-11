#!/bin/bash
source includes/core.sh
warden env exec -T php-fpm bin/magento app:config:import
elasticSearchIp=$(docker inspect --format "{{with index .NetworkSettings.Networks \"${WARDEN_ENV_NAME}_default\"}}{{.IPAddress}}{{end}}" ${WARDEN_ENV_NAME}-elasticsearch-1)
warden env exec -T php-fpm curl -X PUT "http://${elasticSearchIp}:9200/_cluster/settings" -H 'Content-Type: application/json' -d '{"transient":{"indices.breaker.total.limit":"100%"}}'
:: Limit Increased $elasticSearchIp
