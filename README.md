# magento2warden
Magento2 project using warden

# how to use shell commands
```ssh
cd YourProject
composer require --dev jaroslawzielinski/magento2warden
sh vendor/jaroslawzielinski/magento2warden/setup.sh
cp .env.dist .env
make init
make magento-install magento-setup
make sample-data
make theme
```
and finally
```ssh
make docker-down init theme
```
