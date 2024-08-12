# Shardeum-Validator-Guide

# Minimum Hardware Requirements

> 250 GB SSD storage
> Quad core CPU less than 10 years old if self hosting
> Dual core CPU works if hosted with newer Xeons / EPYC
> 16 GB of ram, 4+ GB of virtual memory recommended
> Hosting: 8 GB RAM + 8 GB Virtual Memory

## Install package managers

```console
sudo apt-get install curl
```

### Add user for Shardeum
```console
sudo adduser <username>
```

### Authorization to the user
```console
sudo usermod -aG sudo <username>
```

### Switching to user
```console
su - <username>
```

### Install Homebrew
```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Execute the codes in the terminal in order
![image](https://github.com/user-attachments/assets/fab903dd-45d6-4d81-9ee2-0d76abfe4be9)

> For this installation

> The last part is different for everyone. Therefore, you should execute what is written in the terminal.

> (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/codespace/.bashrc

> eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

### Install Homebrew's dependencies
```console
sudo apt-get install build-essential
```

### Install GCC
```console
sudo apt-get install build-essential
```

## Update package managers
```console
sudo apt update
```

## Install docker and docker.io
```console
sudo apt install docker.io
```
### Check that docker is working with (should return version 20.10.12 or higher)
```console
docker --version
```

## Install docker-compose
```console
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

### Setup permissions for docker-compose
```console
sudo chmod +x /usr/local/bin/docker-compose
```
### Check that docker-compose is working with (should return version 1.29.2 or higher):
```console
docker-compose --version
```
## Port control and open port
```console
sudo lsof -i -P -n | grep LISTEN
```

# Download and Install Validator
```console
curl -O https://raw.githubusercontent.com/shardeum/validator-dashboard/main/installer.sh && chmod +x installer.sh && ./installer.sh
```










