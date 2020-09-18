#!/bin/bash
# Se edita el archivo dir.conf
sed -ie 's,DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm,DirectoryIndex index.php index.html index.cgi index.pl index.xhtml,g' /etc/apache2/mods-enabled/dir.conf
# reiniciamos apache
service apache2 restart