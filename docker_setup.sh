#!/bin/bash
# Install Docker
sudo apt install containerd -y
sudo apt update
sudo apt install docker.io -y
sudo apt install --reinstall ca-certificates -y
sudo update-ca-certificates
sudo systemctl restart docker
sudo usermod -aG docker $USER
docker --version
# negrp docker

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
