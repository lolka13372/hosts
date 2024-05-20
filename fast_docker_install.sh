#!/bin/bash

# Обновить пакеты и установить необходимые зависимости
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# Создать директорию для ключей apt
sudo install -m 0755 -d /etc/apt/keyrings

# Скачать официальный GPG-ключ Docker и добавить его в систему
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Добавить репозиторий Docker в источники apt
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Обновить список пакетов apt
sudo apt-get update

# Установить Docker и его компоненты
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Клонировать репозиторий 3x-ui в каталог пользователя
git clone https://github.com/MHSanaei/3x-ui.git $HOME/3x-ui

echo "Docker и репозиторий 3x-ui успешно установлены и клонированы."
