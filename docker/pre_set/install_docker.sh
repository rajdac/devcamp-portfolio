# https://jiafulow.github.io/blog/2020/06/30/install-docker-on-linux-mint-19.3/

#!/usr/bin/env bash

# Uninstall any Docker packages
sudo apt remove docker docker-engine docker.io containerd runc

# https://docs.docker.com/install/linux/docker-ce/ubuntu/
# Install packages to allow apt to use a repository over HTTPS
sudo apt update
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that the key has been added
sudo apt-key fingerprint 0EBFCD88

# Set up the Docker "stable" repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Install Docker Engine
sudo apt-get update
sudo apt-get install docker.io

# https://docs.docker.com/compose/install/
# sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# https://docs.docker.com/install/linux/linux-postinstall/
# Allow non-privileged users to run Docker commands
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
