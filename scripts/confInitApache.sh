#!/bin/bash
sudo echo "ServerName localhost" >> /etc/apache2/apache2.conf
# hacemos el test del apache2.conf
sudo apache2ctl configtest
# reiniciamos el servicio
service apache2 restart

