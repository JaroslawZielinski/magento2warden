# Project

Prerequisites:

* Warden (see here https://docs.warden.dev/installing.html)

How to run project for the first time:

* make init
* make magento-install magento-setup
* make sample-data
* make theme

In case of any troubles:

* make restore-db

How to run project after install:

* make docker-down init theme

# Aliases

* `make tea` (= make theme)
* `make thee` (= make theme)
* `make turkish delight` (= make assets cache)
* `make cold-brew coffee` (= make assets cache)
* `make coffee` (= make cache)
