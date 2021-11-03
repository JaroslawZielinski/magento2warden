#!/bin/bash
source includes/core.sh
:: "Start"
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
brew uninstall warden
rm -rf ~/.warden
docker system prune -f -a --volumes
:: "Finished."
