#!/bin/bash
#
     
echo "Criando a imagem 'glpi-mysql:8:0'..."
docker build -f Dockerfile-mysql  --format=docker -t glpi-mysql:8.0 .

if docker container ls | grep -q "glpi-mysql"; then
   docker contatiner stop glpi-mysql && \
      docker container rm glpi-mysql
else
   if docker container ls -a | grep -q "glpi-mysql"; then
      docker contatiner stop glpi-mysql && \
         docker container rm glpi-mysql
   fi
fi
 docker run -d \
  -p 30306:3306 \
  --name glpi-mysql \
  --network glpi-net \
  -v gglpi_mysql_data:/var/lib/mysql \
glpi-mysql:8.0




