#!/bin/bash

# Kullanıcı adını input olarak isteyin
read -p "Lütfen yeni kullanıcı adı girin: " kullanici_adi

# Yeni kullanıcı ekleyin ve şifre girmesini sağlayın
sudo adduser $kullanici_adi

# Kullanıcıya sudo yetkisi verin
echo "Kullanıcıya sudo yetkisi veriliyor..."
sudo usermod -aG sudo $kullanici_adi

echo "Kullanıcı $kullanici_adi başarıyla oluşturuldu ve sudo yetkisi verildi."
echo "Kuruluma devam etmek için, lütfen bu kullanıcıya geçiş yapın (su - $kullanici_adi) ve shardeum_setup.sh script'ini çalıştırın."
