#!/bin/bash

echo "🔧 Iniciando provisionamento do ambiente GLPI..."

# 1. Criar rede Docker "glpi-net"
if ! docker network ls | grep -q "glpi-net"; then
  echo "🌐 Criando rede Docker 'glpi-net'..."
  docker network create glpi-net
else
  echo "🌐 Rede 'glpi-net' já existe."
fi

# 2. Criar volume "glpi_html"
if ! docker volume ls | grep -q "glpi_html"; then
  echo "📁 Criando volume 'glpi_html'..."
  docker volume create glpi_html
else
  echo "📁 Volume 'glpi_html' já existe."
fi

# 3. Criar volume "glpi_mysql_data"
if ! docker volume ls | grep -q "glpi_mysql_data"; then
  echo "🗃️  Criando volume 'glpi_mysql_data'..."
  docker volume create glpi_mysql_data
else
  echo "🗃️  Volume 'glpi_mysql_data' já existe."
fi

# 4. Subir containers com docker-compose
echo "🚀 Subindo containers com docker-compose..."
docker-compose up -d --build

echo "✅ Ambiente GLPI provisionado com sucesso!"
echo "🌐 Acesse: http://localhost:8080"

