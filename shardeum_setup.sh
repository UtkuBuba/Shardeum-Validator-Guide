#!/bin/bash

echo " _   _ _   _         ______       _                      _____             __ _      _     _ "
echo "| | | | | | |        | ___ \     | |             ___    |  __ \           / _(_)    | |   | |"
echo "| | | | |_| | ___   _| |_/ /_   _| |__   __ _   ( _ )   | |  \/ __ _ _ __| |_ _  ___| | __| |"
echo "| | | | __| |/ / | | | ___ \ | | | '_ \ / _\` |  / _ \/\ | | __ / _\` | '__|  _| |/ _ \ |/ _\` |"
echo "| |_| | |_|   <| |_| | |_/ / |_| | |_) | (_| | | (_>  < | |_\ \ (_| | |  | | | |  __/ | (_| |"
echo " \___/ \__|_|\_\__,_\____/ \__,_|_.__/ \__,_|  \___/\/  \____/\__,_|_|  |_| |_|\___|_|\__,_|"

# Paketlerin kurulu olup olmadığını kontrol eden ve gerekirse yükleyen fonksiyon
install_if_missing() {
    PACKAGE=$1
    if ! dpkg -l | grep -q $PACKAGE; then
        echo "$PACKAGE paketi eksik. Yükleniyor..."
        sudo apt-get update -y
        sudo apt-get install -y $PACKAGE
    else
        echo "$PACKAGE zaten yüklü."
    fi
}

# Gerekli paketleri kontrol et ve yükle
install_if_missing "curl"
install_if_missing "build-essential"
install_if_missing "docker.io"
install_if_missing "ufw"

# Docker çalışıyor mu kontrol edin
if ! sudo systemctl is-active --quiet docker; then
    echo "Docker çalışmıyor. Docker'ı başlatıyorum..."
    sudo service docker start
fi

# Homebrew kurun
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Terminalde komutları çalıştırın
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Homebrew bağımlılıklarını yükleyin
install_if_missing "build-essential"

# GCC yükleyin
install_if_missing "gcc"

# Paket yöneticilerini güncelleyin
echo "Şifreyi girerek paket yöneticilerini güncelleyin:"
sudo apt update

# Docker'ın çalıştığını kontrol edin
docker --version

# Docker-compose'u yükleyin
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Docker-compose için izinleri ayarlayın
echo "Docker-compose izinleri ayarlanıyor..."
sudo chmod +x /usr/local/bin/docker-compose

# Docker-compose'un çalıştığını kontrol edin
docker-compose --version

# Validator kurulumundan önce Docker izinlerini ayarlayın
sudo usermod -aG docker $USER && newgrp docker

# Portları açın
echo "Gerekli portlar açılıyor..."
sudo ufw allow 22
sudo ufw allow 22/tcp
sudo ufw allow 8080/tcp
sudo ufw allow 8081/tcp
sudo ufw allow 9090/tcp
sudo ufw allow 9001/tcp
sudo ufw allow 9001/udp
sudo ufw allow 10001/tcp
sudo ufw allow 10001/udp
sudo ufw enable

# Validator'u İndirin ve Kurun
curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh && ./installer.sh
