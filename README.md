# magento2warden
Magento2 project using warden

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/jaroslawzielinski)

# how to use shell commands
in [packagist](https://packagist.org/packages/jaroslawzielinski/magento2warden)
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
