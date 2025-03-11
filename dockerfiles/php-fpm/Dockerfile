FROM docker.io/wardenenv/php-fpm:8.3-magento2
USER root
# Install missing dependencies
RUN yum -y update
RUN yum -y install mc php-gettext
RUN cd ~
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
RUN HASH=`curl -sS https://composer.github.io/installer.sig`
RUN php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
# repo.magento.com composer credentials
COPY .composer/auth.json.tmpl /root/.composer/auth.json.tmpl
COPY .composer/auth.json.tmpl /home/www-data/.composer/auth.json.tmpl
USER www-data
