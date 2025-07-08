#!/bin/bash
#
echo "Criando a imagem 'glpi-apache-php82'..."
docker build -f Dockerfile-glpi -t glpi-apache2-php82:1.0 .

if docker container ls | grep -q "glpi-web"; then
   docker contatiner stop glpi_web
   docker container rm glpi_web
else
   if docker container ls -a | grep -q "glpi-web"; then
      docker contatiner stop glpi-web
      docker container rm glpi-web
   fi
fi
docker run -d \
  -p 8081:80 \
  --rm \
  --name glpi-web \
  --network glpi-net \
  -v glpi_html:/var/www/html \
glpi-apache2-php82:1.0




