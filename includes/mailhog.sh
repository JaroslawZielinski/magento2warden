#!/bin/bash
source includes/core.sh
mailhogIp=$(docker inspect --format "{{with index .NetworkSettings.Networks \"${WARDEN_ENV_NAME}_default\"}}{{.IPAddress}}{{end}}" mailhog)
printf "Mailhog link: %s\n" "http://${mailhogIp}:8025/"
