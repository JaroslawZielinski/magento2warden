# magento2warden
Magento2 project using warden

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/jaroslawzielinski)

# How to use shell commands
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

# Aliases

* `make tea` (= make theme)
* `make thee` (= make theme)
* `make turkish delight` (= make assets cache)
* `make cold-brew coffee` (= make assets cache)
* `make coffee` (= make cache)

# Possible errors
## Database error
### ERROR 1130 (HY000): Host '' is not allowed to connect to this MySQL server

Your root account, and this statement applies to any account, may only have been added with localhost access (which is recommended).

You can check this with:

```sql
SELECT host FROM mysql.user WHERE User = 'root';
```

If you only see results with localhost and 127.0.0.1, you cannot connect from an external source. If you see other IP addresses, but not the one you're connecting from - that's also an indication.

You will need to add the IP address of each system that you want to grant access to, and then grant privileges:

```sql
CREATE USER 'root'@'ip_address' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'ip_address';
```

If you see %, well then, there's another problem altogether as that is "any remote source". If however you do want any/all systems to connect via root, use the % wildcard to grant access:

```sql
CREATE USER 'root'@'%' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
```

Finally, reload the permissions, and you should be able to have remote access:

```sql
FLUSH PRIVILEGES;
```

solution taken from [here](https://stackoverflow.com/questions/19101243/error-1130-hy000-host-is-not-allowed-to-connect-to-this-mysql-server#answer-19101356)
