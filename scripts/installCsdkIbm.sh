#!/bin/bash
# mkdir /tmp/csdk
tar -xvf /tmp/ibm.csdk.4.50.FC1.LNX.tar
# Instalacion silenciosa del isntalador
# Mas informacion en: https://www.ibm.com/support/knowledgecenter/SSGU8G_12.1.0/com.ibm.cpi.doc/ids_cpi_018.htm
sh ./installclientsdk -i silent -DLICENSE_ACCEPTED=TRUE -DPRQCHECK=FALSE -DUSER_INSTALL_DIR=/opt/IBM/informix -DOVERWRITE_PRODUCT=TRUE
