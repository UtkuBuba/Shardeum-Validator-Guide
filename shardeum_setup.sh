#!/bin/bash

# Kullanıcı adını input olarak isteyin
read -p "Lütfen yeni kullanıcı adı girin: " kullanici_adi

# Shardeum için kullanıcı ekleyin ve şifre girmesini sağlayın
sudo adduser $kullanici_adi

# Kullanıcıya yetki verin
echo "Şifreyi girerek kullanıcıya sudo yetkisi verin:"
echo "<şifreniz>" | sudo -S usermod -aG sudo $kullanici_adi

# Kullanıcı için bir setup scripti oluşturun
sudo -u $kullanici_adi bash -c "cat << 'EOF' > /home/$kullanici_adi/shardeum_user_setup.sh
#!/bin/bash

# Homebrew kurun
/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"

# Terminalde komutları çalıştırın
echo 'eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"' >> /home/$kullanici_adi/.bashrc
eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"

# Homebrew bağımlılıklarını yükleyin
echo "Şifreyi girerek gerekli bağımlılıkları yükleyin:"
echo "<şifreniz>" | sudo -S apt-get install -y build-essential

# GCC yükleyin
echo "Şifreyi girerek GCC'yi yükleyin:"
echo "<şifreniz>" | sudo -S apt-get install -y build-essential

# Paket yöneticilerini güncelleyin
echo "Şifreyi girerek paket yöneticilerini güncelleyin:"
echo "<şifreniz>" | sudo -S apt update

# Docker ve docker.io'yu yükleyin
echo "Şifreyi girerek Docker'ı yükleyin:"
echo "<şifreniz>" | sudo -S apt install -y docker.io

# Docker'ın çalıştığını kontrol edin
docker --version

# Docker-compose'u yükleyin
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Docker-compose için izinleri ayarlayın
echo "Şifreyi girerek Docker-compose izinlerini ayarlayın:"
echo "<şifreniz>" | sudo -S chmod +x /usr/local/bin/docker-compose

# Docker-compose'un çalıştığını kontrol edin
docker-compose --version

# Portları açın
echo "Şifreyi girerek gerekli portları açın:"
echo "<şifreniz>" | sudo -S ufw allow 22
echo "<şifreniz>" | sudo -S ufw allow 22/tcp
echo "<şifreniz>" | sudo -S ufw allow 8080/tcp
echo "<şifreniz>" | sudo -S ufw allow 8081/tcp
echo "<şifreniz>" | sudo -S ufw allow 9090/tcp
echo "<şifreniz>" | sudo -S ufw allow 9001/tcp
echo "<şifreniz>" | sudo -S ufw allow 9001/udp
echo "<şifreniz>" | sudo -S ufw allow 10001/tcp
echo "<şifreniz>" | sudo -S ufw allow 10001/udp
echo "<şifreniz>" | sudo -S ufw enable

# Validator'u İndirin ve Kurun
curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh && ./installer.sh

EOF"

# Setup scriptini çalıştırılabilir yapın
sudo chmod +x /home/$kullanici_adi/shardeum_user_setup.sh

# Kullanıcıya geçiş yapın ve scripti çalıştırın
su - $kullanici_adi -c "/home/$kullanici_adi/shardeum_user_setup.sh"
