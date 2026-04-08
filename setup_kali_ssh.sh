#!/bin/sh
echo "[i] Install the SSH Server"
sudo apt update
sudo apt install openssh-server

echo "[i] Start the SSH service"
sudo service ssh start
sudo systemctl start ssh (for newer versions)

echo "[i] Enable SSH service to start on boot"
sudo service ssh enable
sudo systemctl enable ssh
