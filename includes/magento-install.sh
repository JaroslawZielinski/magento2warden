#!/bin/bash
source includes/core.sh
:: "Start"
## Install Application
warden env exec -T php-fpm bash -c "
## Install Application
bin/magento setup:install \
    --backend-frontname=backend \
    --amqp-host=rabbitmq \
    --amqp-port=5672 \
    --amqp-user=guest \
    --amqp-password=guest \
    --db-host=db \
    --db-name=magento \
    --db-user=magento \
    --db-password=magento \
    --search-engine=elasticsearch7 \
    --elasticsearch-host=elasticsearch \
    --elasticsearch-port=9200 \
    --elasticsearch-index-prefix=magento2 \
    --elasticsearch-enable-auth=0 \
    --elasticsearch-timeout=15 \
    --http-cache-hosts=varnish:80 \
    --session-save=redis \
    --session-save-redis-host=redis \
    --session-save-redis-port=6379 \
    --session-save-redis-db=2 \
    --session-save-redis-max-concurrency=20 \
    --cache-backend=redis \
    --cache-backend-redis-server=redis \
    --cache-backend-redis-db=0 \
    --cache-backend-redis-port=6379 \
    --page-cache=redis \
    --page-cache-redis-server=redis \
    --page-cache-redis-db=1 \
    --page-cache-redis-port=6379

## Configure Application
bin/magento config:set --lock-env web/unsecure/base_url \
    \"https://${TRAEFIK_SUBDOMAIN}.${TRAEFIK_DOMAIN}/\"

bin/magento config:set --lock-env web/secure/base_url \
    \"https://${TRAEFIK_SUBDOMAIN}.${TRAEFIK_DOMAIN}/\"

bin/magento config:set --lock-env web/secure/offloader_header X-Forwarded-Proto

bin/magento config:set --lock-env web/secure/use_in_frontend 1
bin/magento config:set --lock-env web/secure/use_in_adminhtml 1
bin/magento config:set --lock-env web/seo/use_rewrites 1

bin/magento config:set --lock-env system/full_page_cache/caching_application 2
bin/magento config:set --lock-env system/full_page_cache/ttl 604800

bin/magento config:set --lock-env catalog/search/enable_eav_indexer 1

bin/magento config:set --lock-env dev/static/sign 0

bin/magento config:set --lock-env admin/security/session_lifetime 31536000

bin/magento deploy:mode:set -s developer
bin/magento cache:disable block_html full_page

bin/magento indexer:reindex
bin/magento cache:flush
"
:: "Finished."
