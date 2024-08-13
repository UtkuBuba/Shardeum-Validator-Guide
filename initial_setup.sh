#!/bin/bash

# GitHub'dan Script'leri İndirme ve İzin Ayarları

# Shardeum setup script'ini indir
echo "Shardeum setup script'i indiriliyor..."
curl -O https://raw.githubusercontent.com/UtkuBuba/Shardeum-Validator-Guide/main/shardeum_setup.sh

# Script'i çalıştırılabilir hale getirin
echo "Shardeum setup script'i çalıştırılabilir hale getiriliyor..."
chmod +x shardeum_setup.sh

# Kullanıcı Oluşturma İşlemleri

# Kullanıcı adını input olarak isteyin
read -p "Lütfen yeni kullanıcı adı girin: " kullanici_adi

# Yeni kullanıcı ekleyin ve şifre girmesini sağlayın
echo "Yeni kullanıcı oluşturuluyor..."
sudo adduser $kullanici_adi

# Kullanıcıya sudo yetkisi verin
echo "Kullanıcıya sudo yetkisi veriliyor..."
sudo usermod -aG sudo $kullanici_adi

# Shardeum setup script'ini yeni kullanıcının ana dizinine kopyalayın
echo "Shardeum setup script'i yeni kullanıcıya kopyalanıyor..."
sudo cp shardeum_setup.sh /home/$kullanici_adi/

# Script'in sahibi ve grubu olarak yeni kullanıcıyı belirleyin
echo "Shardeum setup script'inin sahipliği güncelleniyor..."
sudo chown $kullanici_adi:$kullanici_adi /home/$kullanici_adi/shardeum_setup.sh

echo "İlk adımlar tamamlandı! Şimdi yeni kullanıcıya geçiş yaparak Shardeum kurulumu için script'i çalıştırabilirsiniz."
echo "Kullanıcıya geçmek için: su - $kullanici_adi"
echo "Ardından: ./shardeum_setup.sh komutunu çalıştırın."
