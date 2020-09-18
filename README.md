# pdo_informix con php7.2 en docker

Este es un proyecto inicial que ejecuta una instalación del cliente sdk de informix para poder crear el pdo_informix.so para el uso de conexiones php con informix.

Lamentablemte el cliente sdk pesa casi 200 Megas por lo que se tendra que descargar y colocar en la carpeta ibm.

Para descargar el archivo puedes usar este link:
https://drive.google.com/file/d/1prZ_MxgspKj26oYEAi2eXfamgJVAGecX/view?usp=sharing

Recuerda que al descargar el archivo solo colocalo en la carpeta ibm. El nombre del archivo es: ibm.csdk.4.50.FC1.LNX.tar

Para levantar el docker se require compose:

## Levantar el docker

En la terminal solo quedate en raiz donde esta el archivo Dockerfile y ejecuta

`docker-compose up -d`
