# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

.DEFAULT_GOAL := help

init: ## Init
	./includes/init.sh

docker-up: ## Docker Up
	@echo "Dockers UP"
	warden env up -d

docker-down: ## Docker Down
	@echo "Dockers Down"
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
	make db-ip urls mailhog

theme: ## Theme
	make fix-dbpermissions
	./includes/fix-elasticsearch.sh
	./includes/theme.sh
	./includes/adminuser.sh
	make db-ip urls mailhog

assets: ## Assets
	make fix-dbpermissions
	./includes/fix-elasticsearch.sh
	./includes/assets.sh
	make db-ip urls mailhog

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
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
