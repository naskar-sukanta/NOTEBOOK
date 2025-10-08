# import key
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-archive-keyring.gpg

# add repo (example for Ubuntu 22.04 / jammy, change 'jammy' to your release)
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-archive-keyring.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" \
  | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

sudo apt update
sudo apt install -y mongodb-mongosh

mongosh --version
