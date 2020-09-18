#!/bin/bash
# Instalamos  https://www.comoinstalarlinux.com/como-instalar-mcrypt-como-modulo-de-php-7-2-en-ubuntu-server-18-04/
sudo apt install php7.2-dev libmcrypt-dev php-pear -y
sudo pecl install mcrypt-1.0.1 -y
# Escribimos al final del php.ini
sudo echo "extension=mcrypt.so" >> /etc/php/7.2/apache2/php.ini
# reiniciamos el servicio
service apache2 restart