# magento2warden
Magento2 project using warden

# how to use shell commands
```ssh
cd YourProject
composer config repositories.magento2warden vcs https://github.com/JaroslawZielinski/magento2warden.git
composer require jaroslawzielinski/magento2warden dev-master
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
