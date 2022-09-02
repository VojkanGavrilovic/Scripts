#!/bin/sh
sudo echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/sshd_config
sudo systemctl restart sshd