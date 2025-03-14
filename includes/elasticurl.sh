#!/bin/bash
source includes/core.sh
elasticSearchIp=$(docker inspect --format "{{with index .NetworkSettings.Networks \"${WARDEN_ENV_NAME}_default\"}}{{.IPAddress}}{{end}}" ${WARDEN_ENV_NAME}-elasticsearch-1)
printf "Elasticsearch indexes: %s\n" "http://${elasticSearchIp}:9200/_cat/indices?v"
