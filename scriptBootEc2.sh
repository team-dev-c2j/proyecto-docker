#!/bin/bash

# Redirige la salida estándar y de error a un archivo de registro
exec > /var/log/user-data.log 2>&1

echo "Iniciando User Data..."
date

# Actualiza el sistema e instala Docker y Docker Compose
sudo apt update -y
sudo apt install -y docker.io docker-compose

# Inicia el servicio Docker
sudo systemctl start docker
sudo systemctl enable docker

# Descarga tu archivo docker-compose.yml (reemplaza la URL con la correcta)
wget https://github.com/team-dev-c2j/proyecto-docker/raw/main/docker-compose.yml -O /home/ubuntu/docker-compose.yml

# Ejecuta docker-compose (reemplaza con la ubicación de tu archivo si es diferente)
docker-compose -f /home/ubuntu/docker-compose.yml up -d

