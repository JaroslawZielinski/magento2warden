#!/bin/bash
source includes/core.sh
:: "Start"
magentoSqlGz="magento.sql.gz"
cat $magentoSqlGz | gunzip -c | warden db import
:: "Finished."
