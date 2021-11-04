#!/bin/bash
source includes/core.sh
:: "Start"
docker build -t ${PHP_IMAGE_NAME} dockerfiles/php-fpm/
brew install davidalger/warden/warden
warden svc up
## Init Warden env
warden sign-certificate ${TRAEFIK_DOMAIN}
warden env up -d
warden env exec -u root -T php-fpm bash -c "`which envsubst` < /home/www-data/.composer/auth.json.tmpl > /home/www-data/.composer/auth.json"
warden env exec -u root -T php-fpm bash -c "sudo chown www-data:www-data -R /home/www-data/"
. includes/fix-dbpermissions.sh
warden env exec -u root -T php-fpm bash -c "`which envsubst` < /root/.composer/auth.json.tmpl > /root/.composer/auth.json"
read -p "Rebuild project with composer (y/n)?" choice
case "$choice" in
  y|Y ) echo "yes";;
  n|N ) exit 0;;
  * ) exit 0;;
esac
META_PACKAGE=magento/project-community-edition
META_VERSION=2.4.0
warden env exec -T php-fpm bash -c "
composer create-project --repository-url=https://repo.magento.com/ \
    \"${META_PACKAGE}\" /tmp/exampleproject \"${META_VERSION}\"
rsync -a /tmp/exampleproject/ /var/www/html/
rm -rf /tmp/exampleproject/
"
:: "Finished."
