#!/bin/sh
sudo echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo useradd -m -d /home/milanp milanp
sudo usermod -aG sudo milanp

sudo mkdir /home/milanp/.ssh
sudo > /home/milanp/.ssh/authorized_keys
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHsbBL8q0zCMk+fdW+iV14/ra9Z/yu7mraD/b4Cj6e9eNL0iXT8ql3Kw2+XhQMmeOILeqw3BnDzhNBQzbinhVYvwRdQPd1+7ZLqRcW4wUKRTKKRhd4HJzeJ4LkFlNSRI3BNR4nhvN2o6GXmMe4gahW7hsVINYgvIr8yWUh0dypQolXFsnZ9Q/v3X8/EQiD9KOar2QCZfXV8hjiwv9MVlRpU9WKZnFGnHRTGFQyMnAgJqqiXPRDzIhA654Vim1IYOjg7j4qvwRAgps93VIVDmYPEnRDyRdTJ14lYl6dh7qXVaaoeqsiPH8mfIo2TETy9CCX9qwIiXngh/09vbowjclbxak9pgKQdR67ysvC1ETq9IktpDJcidpUI8rHGfWAY7GsK2js0gZdzr9G/ZdPOZzxPz5qfUmr21SzZ9sfpVoFoDelTw+n16NXuHC256/qfaUvnLRNDM3ufibKjIOPjU7CHQ0WBpePWDZUOICxmslzRKQDxWHN7+ai/D8C4tPB9Vi6aMOHKeofPzZrXTJqiYuTYRy4bSEZIQWtva8SKOP2wLS+I6+pvqx6ga0NNadxWulKEiaz6NM+r6kKn0AqWRJBhi3goHoS4xFuatXE92xeOxTRR4gQvSZBCGj/oyCLkuBHQVJ9EHkGYdml9/Wwgqok5E8lsMfuJhSzGO+LLKv4nw== milan.piscevic@europoint.com" >> /home/milanp/.ssh/authorized_keys