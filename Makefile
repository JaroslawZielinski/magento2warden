# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

.DEFAULT_GOAL := help

init: ## Init
	./includes/init.sh

docker-up: ## Docker Up
	./includes/dockerup.sh
	warden env up -d

docker-down: ## Docker Down
	./includes/dockerdown.sh
	warden env down -v

docker-restart: ## Docker Restart
	make docker-down docker-up

docker-destroy: ## Docker Destroy
	./includes/docker-destroy.sh

db-ip: ## Show Db IP
	./includes/dbip.sh

shell: ## Shell
	warden shell

urls: ## Show Urls
	./includes/urls.sh

cache: ## Cache
	./includes/cache.sh
	make db-ip urls mailhog elastic-url

theme: ## Theme
	rm -rf generated/
	make fix-dbpermissions
	./includes/fix-elasticsearch.sh
	./includes/theme.sh
	./includes/indfix.sh
	./includes/adminuser.sh
	make db-ip urls mailhog elastic-url
tea: ## alias for Theme
	make theme

thee: ## alias for Theme
	make theme

indfix: ## IndFix
	./includes/indfix.sh

assets: ## Assets
	make fix-dbpermissions
	./includes/fix-elasticsearch.sh
	./includes/assets.sh
	make db-ip urls mailhog elastic-url

elastic-limit: ## Elastic Limit
	./includes/fix-elasticsearch-limit.sh
	make cache

elastic-url: ## Elastic Url
	./includes/elasticurl.sh

revendor: ## Revendor
	./includes/revendor.sh

fix-dbpermissions: ## Fix Db permissions
	./includes/fix-dbpermissions.sh

magento-install: ## Magento Install
	./includes/magento-install.sh

magento-setup: ## Magento Setup
	./includes/magento-setup.sh

sample-data: ## Install Sample Data
	./includes/sample-data.sh

restore-db: ## Restore Db From magento.sql.gz
	./includes/restore-db.sh

save-db: ## Save Db To magento.sql.gz
	./includes/save-db.sh

mailhog: ## Open mail hog
	./includes/mailhog.sh

mageplaza: ## Install Mageplaza Smtp Module
	./includes/mageplaza.sh
	make theme

devurnfix: ## Magento Dev URN Regenerate
	./includes/devurnfix.sh
	make cache

fix-elastic: ## Fix Elastic
	./includes/fix-elasticsearch.sh
	make cache

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
