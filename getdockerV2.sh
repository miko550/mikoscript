#!/bin/bash

# Remove old Docker versions
sudo apt-get remove -y docker docker.io containerd runc

# Update system packages
sudo apt-get update

# Install required dependencies
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Ensure keyrings directory exists
sudo mkdir -p /etc/apt/keyrings

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Create the Docker group if it doesn't exist
if ! getent group docker >/dev/null; then
    sudo groupadd docker
fi

# Add the current user to the Docker group
sudo usermod -aG docker $USER

# Inform the user to log out and back in
echo "Please log out and log back in to apply group changes."

# Test Docker installation
docker run hello-world
