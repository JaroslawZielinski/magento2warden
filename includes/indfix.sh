#!/bin/bash
source includes/core.sh
:: "Start"
mysqlIP=$(docker inspect --format "{{with index .NetworkSettings.Networks \"${WARDEN_ENV_NAME}_default\"}}{{.IPAddress}}{{end}}" ${WARDEN_ENV_NAME}-db-1)
warden env exec -T php-fpm mysql -A -h $mysqlIP  -u magento -pmagento magento -e 'UPDATE indexer_state SET status="valid" WHERE status="invalid"'
:: "Finished."
