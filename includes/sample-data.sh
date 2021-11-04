#!/bin/bash
source includes/core.sh
:: "Start"
warden env exec -T php-fpm bash -c "php -d memory_limit=-1 bin/magento sampledata:deploy -vvv"
warden env exec -T php-fpm bin/magento module:enable Magento_CatalogSampleData Magento_GroupedProductSampleData Magento_BundleSampleData Magento_DownloadableSampleData Magento_ConfigurableSampleData Magento_ReviewSampleData Magento_CatalogRuleSampleData Magento_OfflineShippingSampleData Magento_SalesRuleSampleData Magento_TaxSampleData Magento_MsrpSampleData Magento_SwatchesSampleData Magento_ThemeSampleData Magento_CustomerSampleData Magento_CmsSampleData Magento_SalesSampleData Magento_ProductLinksSampleData Magento_WidgetSampleData Magento_WishlistSampleData
:: "Finished."
