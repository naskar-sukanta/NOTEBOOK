#!/bin/bash
sudo apt install containerd -y
sudo apt update
sudo apt install docker.io -y
sudo apt install --reinstall ca-certificates -y
sudo update-ca-certificates
sudo systemctl restart docker
sudo usermod -aG docker $USER
docker --version
# negrp docker
