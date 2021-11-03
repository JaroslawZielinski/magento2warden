FROM docker.io/wardenenv/php-fpm:7.4-magento2
USER root
# Install missing dependencies
RUN yum -y update
RUN yum -y install wget curl mc php-gettext
RUN sudo composer self-update
# repo.magento.com composer credentials
COPY .composer/auth.json.tmpl /root/.composer/auth.json.tmpl
COPY .composer/auth.json.tmpl /home/www-data/.composer/auth.json.tmpl
USER www-data
