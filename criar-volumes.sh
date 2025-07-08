#!/bin/bash

# Cria volume para os arquivos do GLPI
if ! docker volume ls | grep -q "glpi_html"; then
  echo "Criando volume 'glpi_html'..."
  docker volume create glpi_html
else
  echo "Volume 'glpi_html' já existe."
fi

# Cria volume para os dados do MySQL
if ! docker volume ls | grep -q "glpi_mysql_data"; then
  echo "Criando volume 'glpi_mysql_data'..."
  docker volume create glpi_mysql_data
else
  echo "Volume 'glpi_mysql_data' já existe."
fi

