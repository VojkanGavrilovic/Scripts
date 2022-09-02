#!/bin/sh
echo "PubkeyAcceptedKeyTypes +ssh-rsa"
sudo systemctl restart sshd
apt update && apt upgrade