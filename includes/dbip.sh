#!/bin/bash
source includes/core.sh
mysqlIP=$(docker inspect --format "{{with index .NetworkSettings.Networks \"${WARDEN_ENV_NAME}_default\"}}{{.IPAddress}}{{end}}" ${WARDEN_ENV_NAME}-db-1)
:: $mysqlIP
