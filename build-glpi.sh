#!/bin/bash
#
echo "Criando a imagem 'glpi-apache-php82'..."
docker build -f Dockerfile-glpi --no-cache  -t glpi-apache2-php82:1.0 .

if docker container ls | grep glpi-web; then
   docker container stop glpi-web
   docker container rm glpi-web
else
   if docker container ls -a | grep glpi-web; then
      docker container stop glpi-web
      docker container rm glpi-web
   fi
fi
docker run -d \
  --rm
  -p 8081:80 \
  --name glpi-web \
  --network glpi-net \
  -v glpi_html:/var/www/html \
glpi-apache2-php82:1.0

docker logs glpi-web




