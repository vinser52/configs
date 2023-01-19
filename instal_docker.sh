#!/bin/bash

# Uninstall old versions
apt-get remove docker docker-engine docker.io containerd runc

# Install packages to allow apt to use a repository over HTTPS
apt-get update
apt-get install \
	ca-certificates \
	curl \
	gnupg \
	lsb-release

# Add Docker’s official GPG key
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

# Install Docker Engine, containerd, and Docker Compose.
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Create the docker group.
groupadd -f docker

# Add your user to the docker group.
usermod -aG docker $USER

# Activate the changes to groups
newgrp docker


echo "Run /"docker run hello-world/" to verify that you can run docker commands without sudo"
