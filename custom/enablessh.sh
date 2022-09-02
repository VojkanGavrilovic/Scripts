#!/bin/sh
echo "PubkeyAcceptedKeyTypes +ssh-rsa"
sudo systemctl restart sshd
sudo apt install python-is-python3