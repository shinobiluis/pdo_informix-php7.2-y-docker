FROM ubuntu:18.04
LABEL vendor=Geek_Luis
LABEL version=1.0.0

# Copiamos archivos temporales
COPY ./scripts/confInitApache.sh /tmp
COPY ./scripts/confPhpApache.sh /tmp
COPY ./scripts/createPdoInformix.sh /tmp
COPY ./scripts/installModulesPhp.sh /tmp
COPY ./scripts/installCsdkIbm.sh /tmp
COPY ./ibm/ibm.csdk.4.50.FC1.LNX.tar /tmp
COPY ./pdo/PDO_INFORMIX-1.3.3.tgz /tmp


#Instalaciones iniciales
RUN apt-get -y update
RUN apt-get -y upgrade
# Instalamos el sudo
RUN apt-get install -y sudo
#Zona horaria
RUN sudo ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime
# RUN sudo apt-get install -y vim 
# # Instalamos y configuramos apache de forma inicial
# #RUN apt-get install -y apache2 && apt-get clean
RUN apt-get install -y apache2
#Ejecutamos la configuracion inical del apache
RUN sudo sh /tmp/confInitApache.sh

# Instalamos PHP7.2
RUN sudo apt-get install php7.2 -y
RUN php -v
RUN sudo apt-get install libapache2-mod-php7.2 -y
RUN apt-get install php7.2-dev -y
RUN sudo sh /tmp/confPhpApache.sh
COPY ./php/info.php /var/www/html/info.php
COPY ./php/informix.php /var/www/html/informix.php

# # Instlamos modulos de php
# RUN sudo sh /tmp/installModulesPhp.sh

# Instalamos el CSDK de informix
WORKDIR /tmp
RUN sh /tmp/installCsdkIbm.sh

# Creamos el pdo_informix
WORKDIR /tmp
RUN sh /tmp/createPdoInformix.sh
WORKDIR /tmp/PDO_INFORMIX-1.3.3
RUN phpize7.2
RUN sed -ie 's,elif test -f $prefix/include/php/ext/pdo/php_pdo_driver.h; then,elif test -f $prefix/include/php/20170718/ext/pdo/php_pdo_driver.h; then,g' configure
RUN sed -ie 's,pdo_inc_path=$prefix/include/php/ext, pdo_inc_path=$prefix/include/php/20170718/ext,g' configure
RUN ./configure --with-pdo-informix=/opt/IBM/informix --with-php-config=/usr/bin/php-config7.2
RUN make
RUN make install
RUN echo 'extension=pdo_informix.so' | sudo tee -a /etc/php/7.2/apache2/conf.d/pdo_informix.ini
RUN ln -s /etc/php/7.2/apache2/conf.d/pdo_informix.ini /etc/php/7.2/cli/conf.d/20-pdo_informix.ini
# RUN ln -s /etc/php/7.2/apache2/conf.d/pdo_informix.ini /etc/php/7.2/fpm/conf.d/20-pdo_informix.ini
RUN echo "export INFORMIXDIR=/opt/IBM/informix" >> /etc/apache2/envvars
RUN echo "export LD_LIBRARY_PATH=/opt/IBM/informix/lib:/opt/IBM/informix/lib/esql:/opt/IBM/informix/lib/cli:/opt/IBM/informix/lib/c++:/opt/IBM/informix/lib/client:/opt/IBM/informix/lib/dmi" >> /etc/apache2/envvars
RUN service apache2 restart
# RUN sudo echo "/opt/IBM/informix/lib/cli" >> /etc/ld.so.conf
# RUN sudo echo "/opt/IBM/informix/lib/esql" >> /etc/ld.so.conf
# RUN sudo echo "/opt/IBM/informix/lib" >> /etc/ld.so.conf





CMD apachectl -D FOREGROUND