#!/bin/bash
sudo apt-get install libapache2-mod-php7.2 -y
sudo apt-get install -y php7.2-xml
sudo apt-get install -y php7.2-gd
sudo apt-get install -y php7.2-opcache
sudo apt-get install -y php7.2-mysql
sudo apt-get install -y php7.2-zip
sudo apt-get install -y php7.2-soap
sudo apt-get install -y php7.2-sybase
sudo apt-get install -y php7.2-mbstring
sudo apt-get install -y unzip
sudo apt-get install -y npm build-essential
sudo apt-get install -y ufw
sudo apt-get install -y net-tools
# Instalamos  https://www.comoinstalarlinux.com/como-instalar-mcrypt-como-modulo-de-php-7-2-en-ubuntu-server-18-04/
sudo apt install php7.2-dev libmcrypt-dev php-pear -y
sudo pecl install mcrypt-1.0.1 -y
# Escribimos al final del php.ini
sudo echo "extension=mcrypt.so" >> /etc/php/7.2/apache2/php.ini
# reiniciamos el servicio
service apache2 restart