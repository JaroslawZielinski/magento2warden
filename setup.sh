#!/bin/sh

mkdir -p .warden/conf
mkdir -p dockerfiles/php-fpm/.composer
mkdir -p includes
mkdir -p dbtests

if [ ! -f ".env.dist" ];
then
  echo "\".env.dist\" copied."
  cp vendor/jaroslawzielinski/magento2warden/.env.dist .
else
  echo "\".env.dist\" already exists."
fi

if [ ! -f ".warden/conf/01-php.ini" ];
then
  echo "\".warden/conf/01-php.ini\" copied."
  cp vendor/jaroslawzielinski/magento2warden/.warden/conf/01-php.ini .warden/conf/
else
  echo "\".warden/conf/01-php.ini\" already exists."
fi

if [ ! -f ".warden/warden-env.yml" ];
then
  echo "\".warden/warden-env.yml\" copied."
  cp vendor/jaroslawzielinski/magento2warden/.warden/warden-env.yml .warden/
else
  echo "\".warden/warden-env.yml\" already exists."
fi

if [ ! -f "Makefile" ];
then
  echo "\"Makefile\" copied."
  cp vendor/jaroslawzielinski/magento2warden/Makefile .
else
  echo "\"Makefile\" already exists."
fi

if [ ! -f "PROJECT.md" ];
then
  echo "\"PROJECT.md\" copied."
  cp vendor/jaroslawzielinski/magento2warden/PROJECT.md .
else
  echo "\"PROJECT.md\" already exists."
fi

if [ ! -f "dockerfiles/php-fpm/.composer/auth.json.tmpl" ];
then
  echo "\"dockerfiles/php-fpm/.composer/auth.json.tmpl\" copied."
  cp vendor/jaroslawzielinski/magento2warden/dockerfiles/php-fpm/.composer/auth.json.tmpl dockerfiles/php-fpm/.composer/
else
  echo "\"dockerfiles/php-fpm/.composer/auth.json.tmpl\" already exists."
fi

if [ ! -f "dockerfiles/php-fpm/Dockerfile" ];
then
  echo "\"dockerfiles/php-fpm/Dockerfile\" copied."
  cp vendor/jaroslawzielinski/magento2warden/dockerfiles/php-fpm/Dockerfile dockerfiles/php-fpm/
else
  echo "\"dockerfiles/php-fpm/Dockerfile\" already exists."
fi

if [ ! -f "includes/adminuser.sh" ];
then
  echo "\"includes/adminuser.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/adminuser.sh includes/
else
  echo "\"includes/adminuser.sh\" already exists."
fi

if [ ! -f "includes/assets.sh" ];
then
  echo "\"includes/assets.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/assets.sh includes/
else
  echo "\"includes/assets.sh\" already exists."
fi

if [ ! -f "includes/cache.sh" ];
then
  echo "\"includes/cache.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/cache.sh includes/
else
  echo "\"includes/cache.sh\" already exists."
fi

if [ ! -f "includes/core.sh" ];
then
  echo "\"includes/core.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/core.sh includes/
else
  echo "\"includes/core.sh\" already exists."
fi

if [ ! -f "includes/dbip.sh" ];
then
  echo "\"includes/dbip.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/dbip.sh includes/
else
  echo "\"includes/dbip.sh\" already exists."
fi

if [ ! -f "includes/devurnfix.sh" ];
then
  echo "\"includes/devurnfix.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/devurnfix.sh includes/
else
  echo "\"includes/devurnfix.sh\" already exists."
fi

if [ ! -f "includes/docker-destroy.sh" ];
then
  echo "\"includes/docker-destroy.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/docker-destroy.sh includes/
else
  echo "\"includes/docker-destroy.sh\" already exists."
fi

if [ ! -f "includes/dockerdown.sh" ];
then
  echo "\"includes/dockerdown.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/dockerdown.sh includes/
else
  echo "\"includes/dockerdown.sh\" already exists."
fi

if [ ! -f "includes/dockerup.sh" ];
then
  echo "\"includes/dockerup.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/dockerup.sh includes/
else
  echo "\"includes/dockerup.sh\" already exists."
fi

if [ ! -f "includes/fix-dbpermissions.sh" ];
then
  echo "\"includes/fix-dbpermissions.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/fix-dbpermissions.sh includes/
else
  echo "\"includes/fix-dbpermissions.sh\" already exists."
fi

if [ ! -f "includes/fix-elasticsearch.sh" ];
then
  echo "\"includes/fix-elasticsearch.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/fix-elasticsearch.sh includes/
else
  echo "\"includes/fix-elasticsearch.sh\" already exists."
fi

if [ ! -f "includes/fix-elasticsearch-limit.sh" ];
then
  echo "\"includes/fix-elasticsearch-limit.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/fix-elasticsearch-limit.sh includes/
else
  echo "\"includes/fix-elasticsearch-limit.sh\" already exists."
fi

if [ ! -f "includes/indfix.sh" ];
then
  echo "\"includes/indfix.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/indfix.sh includes/
else
  echo "\"includes/indfix.sh\" already exists."
fi

if [ ! -f "includes/init.sh" ];
then
  echo "\"includes/init.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/init.sh includes/
else
  echo "\"includes/init.sh\" already exists."
fi

if [ ! -f "includes/magento-install.sh" ];
then
  echo "\"includes/magento-install.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/magento-install.sh includes/
else
  echo "\"includes/magento-install.sh\" already exists."
fi

if [ ! -f "includes/magento-setup.sh" ];
then
  echo "\"includes/magento-setup.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/magento-setup.sh includes/
else
  echo "\"includes/magento-setup.sh\" already exists."
fi

if [ ! -f "includes/mageplaza.sh" ];
then
  echo "\"includes/mageplaza.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/mageplaza.sh includes/
else
  echo "\"includes/mageplaza.sh\" already exists."
fi

if [ ! -f "includes/mailhog.sh" ];
then
  echo "\"includes/mailhog.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/mailhog.sh includes/
else
  echo "\"includes/mailhog.sh\" already exists."
fi

if [ ! -f "includes/restore-db.sh" ];
then
  echo "\"includes/restore-db.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/restore-db.sh includes/
else
  echo "\"includes/restore-db.sh\" already exists."
fi

if [ ! -f "includes/revendor.sh" ];
then
  echo "\"includes/revendor.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/revendor.sh includes/
else
  echo "\"includes/revendor.sh\" already exists."
fi

if [ ! -f "includes/sample-data.sh" ];
then
  echo "\"includes/sample-data.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/sample-data.sh includes/
else
  echo "\"includes/sample-data.sh\" already exists."
fi

if [ ! -f "includes/save-db.sh" ];
then
  echo "\"includes/save-db.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/save-db.sh includes/
else
  echo "\"includes/save-db.sh\" already exists."
fi

if [ ! -f "includes/theme.sh" ];
then
  echo "\"includes/theme.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/theme.sh includes/
else
  echo "\"includes/theme.sh\" already exists."
fi

if [ ! -f "includes/urls.sh" ];
then
  echo "\"includes/urls.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/includes/urls.sh includes/
else
  echo "\"includes/urls.sh\" already exists."
fi

if [ ! -f "dbtests/config.env" ];
then
  echo "\"dbtests/config.env\" copied."
  cp vendor/jaroslawzielinski/magento2warden/dbtests/config.env dbtests/
else
  echo "\"dbtests/config.env\" already exists."
fi

if [ ! -f "dbtests/idFinder.sh" ];
then
  echo "\"dbtests/idFinder.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/dbtests/idFinder.sh dbtests/
else
  echo "\"dbtests/idFinder.sh\" already exists."
fi

if [ ! -f "dbtests/README.md" ];
then
  echo "\"dbtests/README.md\" copied."
  cp vendor/jaroslawzielinski/magento2warden/dbtests/README.md dbtests/
else
  echo "\"dbtests/README.md\" already exists."
fi

if [ ! -f "dbtests/structureFinder.sh" ];
then
  echo "\"dbtests/structureFinder.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/dbtests/structureFinder.sh dbtests/
else
  echo "\"dbtests/structureFinder.sh\" already exists."
fi

if [ ! -f "dbtests/wordFinder.sh" ];
then
  echo "\"dbtests/wordFinder.sh\" copied."
  cp vendor/jaroslawzielinski/magento2warden/dbtests/wordFinder.sh dbtests/
else
  echo "\"dbtests/wordFinder.sh\" already exists."
fi
