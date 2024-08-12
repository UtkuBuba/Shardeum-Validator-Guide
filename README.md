# Shardeum-Validator-Rehberi

> Öncelikle [burdan](https://shardeum.org/incentivized-testnet/validator) teşvikli testnet için cüzdanımızı bağlayıp validator task bölümünde olduğumuzdan emin olalım

> [Referral](https://shardeum.org/incentivized-testnet/referral) kısmına utkububa yazıp sign tıklarsanız bu repoya en güzel desteğiniz olur

# Minimum Donanım Gereksinimleri

> 250 GB SSD depolama

> Kendi sunucusunu barındıranlar için 10 yıldan eski olmayan dört çekirdekli CPU

> Yeni Xeon / EPYC işlemcilerle barındırılanlar için çift çekirdekli CPU uygundur

> 16 GB RAM, 4+ GB sanal bellek önerilir

> Barındırma: 8 GB RAM + 8 GB Sanal Bellek

## Paket yöneticilerini kurun

```console
sudo apt-get install curl
```

### Shardeum için kullanıcı ekleyin
```console
sudo adduser <kullanıcı_adı>
```

### Kullanıcıya yetki verin
```console
sudo usermod -aG sudo <kullanıcı_adı>
```

### Kullanıcıya geçiş yapın
```console
su - <kullanıcı_adı>
```

### Homebrew kurun
```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Terminalde sırasıyla komutları çalıştırın
![image](https://github.com/user-attachments/assets/fab903dd-45d6-4d81-9ee2-0d76abfe4be9)

> Bu kurulum için

> Son kısım herkese göre farklıdır. Bu nedenle terminalde yazılanları çalıştırmalısınız.

> (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/codespace/.bashrc

> eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

### Homebrew bağımlılıklarını yükleyin
```console
sudo apt-get install build-essential
```

### GCC yükleyin
```console
sudo apt-get install build-essential
```

## Paket yöneticilerini güncelleyin
```console
sudo apt update
```

## Docker ve docker.io'yu yükleyin
```console
sudo apt install docker.io
```
### Docker'ın çalıştığını kontrol edin (20.10.12 veya daha yüksek bir sürüm döndürmelidir)
```console
docker --version
```

## Docker-compose'u yükleyin
```console
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

### Docker-compose için izinleri ayarlayın
```console
sudo chmod +x /usr/local/bin/docker-compose
```
### Docker-compose'un çalıştığını kontrol edin (1.29.2 veya daha yüksek bir sürüm döndürmelidir)
```console
docker-compose --version
```
## Port kontrolü ve port açma
> Eğer 8080 portu kullanılıyorsa, 8081 veya 9090 portunu kullanabilirsiniz.
```console
sudo lsof -i -P -n | grep LISTEN
```
> Alttaki kod bloğunu tek seferde yapıştırıp tüm portları açabilirsiniz.
```console
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
```


# Validator'u İndirin ve Kurun
```console
curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh && ./installer.sh
```

# Validator GUI'yi açın
> Web tarayıcınıza gidin ve aşağıdaki adrese girin
```console
https://localhost:<your-port>
```
> Kurulum sürecinde belirlediğiniz şifreyi girin.
![image](https://github.com/user-attachments/assets/e502ead8-809f-4fc4-8d65-5fc5bfb82e87)

> Artık Shardeum Validator Dashboard'un "Genel Bakış" sayfasını web tarayıcınızda görmelisiniz.
![image](https://github.com/user-attachments/assets/9f461ca7-7f40-4e51-b77a-e24343ee5be4)

## Validator'u başlatın
> "Maintenance" sayfasına gidin, ardından sol üstteki beyaz kutuda bulunan "Start Node" düğmesine tıklayın.
![image](https://github.com/user-attachments/assets/078106ab-ec96-47e2-9d6a-215e3ab6c17a)

### SHM Alın ve Stake Edin

> Testnet token'larını [Shardeum Discord SHM Faucet](https://docs.shardeum.org/docs/faucet/claim) adresinden talep edin.

> Validator'ı başlattıktan sonra "Ayarlar" sayfasına gidin. Cüzdanınızı bağlamanız istenecek.

> Cüzdanınızı bağladıktan sonra aşağıdakileri görmelisiniz.

> "Stake Ekle"ye tıkladığınızda aşağıdaki ekranı göreceksiniz.

> Stake için 10 SHM token.

> Stake ettikten sonra, validator'ınızı durdurun ve tekrar başlatın.

> **Tebrikler**

# Hatalar
> Docker permission hatası görürseniz (aşağıdaki gibi) aşağıdaki kodu girin
```
Got permission denied while trying to connect to the Docker daemon socket at
unix:///var/run/docker.sock:
Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/shardeum-dashboard/json":
dial unix /var/run/docker.sock:
connect:
permission denied
```
```console
sudo usermod -a -G docker $USER && newgrp docker
```

> Validatoru düzenli aralıklarla kontrol etmelisiniz. Bazen durabiliyor. Durduğu zamanlarda ekibin dediğine göre puan kasmıyor.

## Utkububa a.k.a ailenizin Node Runner'ı 













